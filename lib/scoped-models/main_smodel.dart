import 'package:scoped_model/scoped_model.dart';

import './product_smodel.dart';
import './user_smodel.dart';

class MainModel extends Model with UserSModel, ProductSModel {}
