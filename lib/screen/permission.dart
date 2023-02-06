import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class RunTimePer extends StatefulWidget {
  const RunTimePer({Key? key}) : super(key: key);

  @override
  State<RunTimePer> createState() => _RunTimePerState();
}

class _RunTimePerState extends State<RunTimePer> {
  PermissionStatus _permissionCameraStatus = PermissionStatus.denied;
  PermissionStatus _permissionStorageStatus = PermissionStatus.denied;
  PermissionStatus _permissionLocationStatus = PermissionStatus.denied;
  PermissionStatus _permissionContactStatus = PermissionStatus.denied;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get run time permission"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("${Permission.camera}"),
            subtitle: Text(_permissionCameraStatus.toString()),
            trailing: (_permissionCameraStatus.isGranted)
                ? IconButton(
                    icon: const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.black87,
                    ),
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text((await Permission.camera.status).toString()),
                      ));
                    })
                : null,
            onTap: () async {
              _permissionCameraStatus = await Permission.camera.request();
            },
          ),
          const Divider(
            height: 2,
            thickness: 2,
          ),
          ListTile(
            title: Text("${Permission.location}"),
            subtitle: Text(_permissionLocationStatus.toString()),
            trailing: (_permissionLocationStatus.isGranted)
                ? IconButton(
                    icon: const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.black87,
                    ),
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text((await Permission.location.status).toString()),
                      ));
                    })
                : null,
            onTap: () async {
              _permissionLocationStatus = await Permission.camera.request();
            },
          ),
          const Divider(
            height: 2,
            thickness: 2,
          ),
          ListTile(
            title: Text("${Permission.storage}"),
            subtitle: Text(_permissionStorageStatus.toString()),
            trailing: (_permissionStorageStatus.isGranted)
                ? IconButton(
                    icon: const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.black87,
                    ),
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text((await Permission.storage.status).toString()),
                      ));
                    })
                : null,
            onTap: () async {
              _permissionStorageStatus = await Permission.camera.request();
            },
          ),
          const Divider(
            height: 2,
            thickness: 2,
          ),
          ListTile(
            title: Text("${Permission.contacts}"),
            subtitle: Text(_permissionContactStatus.toString()),
            trailing: (_permissionContactStatus.isGranted)
                ? IconButton(
                    icon: const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.black87,
                    ),
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text((await Permission.contacts.status).toString()),
                      ));
                    })
                : null,
            onTap: () async {
              _permissionContactStatus = await Permission.camera.request();
            },
          ),
        ],
      ),
    );
  }
}

/// Permission widget containing information about the passed [Permission]
class PermissionWidget extends StatefulWidget {
  /// Constructs a [PermissionWidget] for the supplied [Permission]
  const PermissionWidget(this._permission, {super.key});

  final Permission _permission;

  @override
  _PermissionState createState() => _PermissionState(_permission);
}

class _PermissionState extends State<PermissionWidget> {
  _PermissionState(this._permission);

  final Permission _permission;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    _listenForPermissionStatus();
  }

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
  }

  Color getPermissionColor() {
    switch (_permissionStatus) {
      case PermissionStatus.denied:
        return Colors.red;
      case PermissionStatus.granted:
        return Colors.green;
      case PermissionStatus.limited:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        _permission.toString(),
        style: Theme.of(context).textTheme.bodyText1,
      ),
      subtitle: Text(
        _permissionStatus.toString(),
        style: TextStyle(color: getPermissionColor()),
      ),
      trailing: (_permission is PermissionWithService)
          ? IconButton(
              icon: const Icon(
                Icons.info_outline_rounded,
                color: Colors.black87,
              ),
              onPressed: () {
                checkServiceStatus(context, _permission as PermissionWithService);
              })
          : null,
      onTap: () {
        requestPermission(_permission);
      },
    );
  }

  void checkServiceStatus(BuildContext context, PermissionWithService permission) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text((await permission.serviceStatus).toString()),
    ));
  }

  requestPermission(Permission permission) async {
    final status = await permission.request();
    setState(() {
      print(status);
      _permissionStatus = status;
      print(_permissionStatus);
    });
  }
}
