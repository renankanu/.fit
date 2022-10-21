import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../core/core.dart';
import '../../../models/models.dart';
import '../service/i_student_service.dart';

part 'student_controller.g.dart';

@Injectable()
class StudentController {
  IStudentService studentService;
  ILogger log;

  StudentController({
    required this.studentService,
    required this.log,
  });

  @Route.post('/')
  Future<Response> save(Request request) async {
    return ResponseHelper.makeResponse(
      handlerResponse: () async {
        return ResponseHelper.baseResponse(
          201,
          responseModel: ResponseModel(
            data: null,
            message: 'Aluno criado com sucesso.',
          ),
        );
      },
      log: log,
    );
  }

  Router get router => _$StudentControllerRouter(this);
}
