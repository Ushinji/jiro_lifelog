import HeaderLayout from '@/components/templates/HeaderLayout';
import DashboardPage from '@/components/pages/DashboardPage';

export default [
  {
    path: '/',
    component: HeaderLayout,
    children: [
      {
        path: '/',
        component: DashboardPage,
      },
    ],
  },
];
