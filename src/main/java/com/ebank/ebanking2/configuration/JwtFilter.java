package com.ebank.ebanking2.configuration;

import com.ebank.ebanking2.Service.JwtService;
import com.ebank.ebanking2.Service.MyUserDetailsService;
import com.ebank.ebanking2.Service.TokenService;
import com.ebank.ebanking2.model.entity.Token;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
//@RequiredArgsConstructor
public class JwtFilter extends OncePerRequestFilter {
    @Autowired
    JwtService jwtService;
    @Autowired
    ApplicationContext context;
    @Autowired
    TokenService tokenService;
//    @Override
//    protected void doFilterInternal(@NonNull HttpServletRequest request,@NonNull HttpServletResponse response,@NonNull FilterChain filterChain) throws ServletException, IOException {
//        String authHeader = request.getHeader("Authorization");
//        String token = null;
//        String userEmail = null;
//        System.out.println("1");
//        if(authHeader != null && authHeader.startsWith("Bearer ")){
//            token = authHeader.substring(7);
//            userEmail = jwtService.extractUserEmail(token);
//            System.out.println("2");
//            System.out.println(userEmail);
//        }
//
//        if(userEmail != null && SecurityContextHolder.getContext().getAuthentication()==null){
//
//            UserDetails userDetails = context.getBean(MyUserDetailsService.class).loadUserByUsername(userEmail);
//            System.out.println("3");
//            System.out.println(userDetails);
////            boolean isTokenValid = (!tokenService.getTokenObjByToken(token).isExpired() && !tokenService.getTokenObjByToken(token).isRevoked());
//            if(jwtService.validateToken(token, userDetails)){ //&& isTokenValid   && !tokenService.getTokenObjByToken(token).isRevoked()
//                UsernamePasswordAuthenticationToken authToken =
//                        new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
//                authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
//                SecurityContextHolder.getContext().setAuthentication(authToken);
//
////                Token tokenObj = tokenService.getTokenObjByToken(token);
////                tokenObj.setLastUsedAt(new Date());
////                tokenService.updateToken(tokenObj.getId() ,tokenObj);
//            }
//        }
//        filterChain.doFilter(request, response);
//    }
@Override
protected void doFilterInternal(@NonNull HttpServletRequest request,
                                @NonNull HttpServletResponse response,
                                @NonNull FilterChain filterChain) throws ServletException, IOException {

    System.out.println("=== JWT FILTER EXECUTING ===");
    System.out.println("Request URI: " + request.getRequestURI());
    System.out.println("Request Method: " + request.getMethod());

    String authHeader = request.getHeader("Authorization");
    String token = null;
    String userEmail = null;

    System.out.println("Authorization Header: " + authHeader);

//    if (authHeader != null && authHeader.startsWith("Bearer ")) {
//        token = authHeader.substring(7);
//        System.out.println("Token extracted successfully");
//
//        try {
//            userEmail = jwtService.extractUserEmail(token);
//            System.out.println("Extracted email: " + userEmail);
//        } catch (Exception e) {
//            System.err.println("Error extracting email: " + e.getMessage());
//            e.printStackTrace();
//        }
//    } else {
//        System.out.println("No valid Authorization header found");
//    }
    if (request.getCookies() != null) {
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("accessToken")) {
                token = cookie.getValue();
                try{
                    userEmail = jwtService.extractUserEmail(token);
                } catch (Exception e) {
                    System.err.println("Error extracting email: " + e.getMessage());
                    e.printStackTrace();
                }
                break;
            }
        }
    } else {
        System.out.println("No valid Authorization header found");
    }

    if (userEmail != null && SecurityContextHolder.getContext().getAuthentication() == null) {
        System.out.println("Attempting to authenticate user: " + userEmail);

        try {
            UserDetails userDetails = context.getBean(MyUserDetailsService.class).loadUserByUsername(userEmail);
            System.out.println("User loaded: " + userDetails.getUsername());
            System.out.println("User authorities: " + userDetails.getAuthorities());

            if (jwtService.validateToken(token, userDetails)) {
                UsernamePasswordAuthenticationToken authToken =
                        new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authToken);

                System.out.println("✅ Authentication set successfully!");
                System.out.println("Authenticated user: " + SecurityContextHolder.getContext().getAuthentication().getName());
                System.out.println("User authorities: " + SecurityContextHolder.getContext().getAuthentication().getAuthorities());
            } else {
                System.out.println("❌ Token validation failed");
            }
        } catch (Exception e) {
            System.err.println("Authentication error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    Authentication finalAuth = SecurityContextHolder.getContext().getAuthentication();
    System.out.println("Final authentication: " + (finalAuth != null ? finalAuth.getName() : "null"));
    System.out.println("=== END JWT FILTER ===");

    filterChain.doFilter(request, response);
}
}
