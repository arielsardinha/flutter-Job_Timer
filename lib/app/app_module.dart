import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_time/app/core/database/database.dart';
import 'package:job_time/app/core/database/database_impl.dart';
import 'package:job_time/app/data/repositories/projects/project_repository.dart';
import 'package:job_time/app/data/repositories/projects/project_repository_impl.dart';
import 'package:job_time/app/data/service/auth/auth_service.dart';
import 'package:job_time/app/data/service/auth/auth_service_impl.dart';
import 'package:job_time/app/data/service/projects/project_service.dart';
import 'package:job_time/app/data/service/projects/project_service_impl.dart';
import 'package:job_time/app/modules/home/home_module.dart';
import 'package:job_time/app/modules/login/login_module.dart';
import 'package:job_time/app/modules/project/project_module.dart';
import 'package:job_time/app/modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<AuthService>((i) => AuthServiceImpl()),
        Bind.lazySingleton<Database>((i) => DatabaseImpl()),
        Bind.lazySingleton<ProjectRepository>(
            (i) => ProjectRepositoryImpl(database: i())),
        Bind.lazySingleton<ProjectService>(
            (i) => ProjectServiceImpl(projectRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, argument) => const SplashPage()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/project', module: ProjectModule())
      ];
}
