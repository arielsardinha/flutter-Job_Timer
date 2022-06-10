import 'package:job_time/app/entities/project_status.dart';
import 'package:job_time/app/view_models.dart/project_model.dart';

abstract class ProjectService {
  Future<void> register(ProjectModel projectModel);

  Future<List<ProjectModel>> findByStatus(ProjectStatus status);
}