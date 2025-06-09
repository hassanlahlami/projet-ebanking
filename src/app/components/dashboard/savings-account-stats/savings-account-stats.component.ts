import { Component, OnInit } from '@angular/core';
import {
  ChartConfiguration,
  ChartType,
  ChartOptions
} from 'chart.js';

@Component({
  selector: 'app-savings-account-stats',
  templateUrl: './savings-account-stats.component.html',
  styleUrls: ['./savings-account-stats.component.css'],
  standalone: false
})
export class SavingsAccountStatsComponent implements OnInit {
  filter: 'month' | 'year' = 'month';

  // New property for last N selection
  lastNOptions = [2, 3, 4, 5, 6];
  lastN: number = 6;  // default to last 12 months or years

  barChartType: 'bar' = 'bar';
  averageDeposit: number = 1520.75;
  growthRate: number = 4.3;
  newAccounts: number = 57;

  barChartData: ChartConfiguration<'bar'>['data'] = {
    labels: [],
    datasets: [
      {
        label: 'Savings Accounts',
        data: [],
        backgroundColor: '#198754',
        borderRadius: 8,
        barThickness: 30
      }
    ]
  };

  barChartOptions: ChartOptions<'bar'> = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: { display: false },
      tooltip: {
        backgroundColor: '#343a40',
        titleColor: '#fff',
        bodyColor: '#f8f9fa',
        borderColor: '#adb5bd',
        borderWidth: 1,
        padding: 10,
        cornerRadius: 6
      }
    },
    scales: {
      x: {
        grid: { display: false },
        ticks: { color: '#6c757d', font: { size: 12 } }
      },
      y: {
        beginAtZero: true,
        grid: { color: '#f1f3f5' },
        ticks: { color: '#6c757d', font: { size: 12 } }
      }
    }
  };

  ngOnInit(): void {
    this.loadChartData();
  }

  onFilterChange(): void {
    this.loadChartData();
  }

  loadChartData(): void {
    let labels: string[] = [];
    let data: number[] = [];

    if (this.filter === 'month') {
      labels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
      data = [10, 18, 12, 20, 25, 22, 27, 30, 15, 17, 14, 19];
    } else {
      labels = ['2020', '2021', '2022', '2023', '2024', '2025'];
      data = [90, 140, 180, 210, 230, 260];
    }

    if (this.lastN < labels.length) {
      labels = labels.slice(labels.length - this.lastN);
      data = data.slice(data.length - this.lastN);
    }

    // Assign a new object to trigger change detection and re-render chart
    this.barChartData = {
      labels: labels,
      datasets: [
        {
          label: 'Savings Accounts',
          data: data,
          backgroundColor: '#198754',
          borderRadius: 8,
          barThickness: 30
        }
      ]
    };
  }

}
