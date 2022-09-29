import 'package:debt_collector/core/core.dart';

class ServiceInjector{
  DebtService debtService = DebtService();
  RouterService routerService = RouterService();
  DialogService dialogService = DialogService();
}

ServiceInjector si = ServiceInjector();