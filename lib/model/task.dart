class Task {
  int? id;
  int? userId;
  int? active;
  String? name;
  String? description;
  String? deadline;
  String? status;
  int? priority;
  String? tag;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Task(
      {this.id,
      this.userId,
      this.active,
      this.name,
      this.description,
      this.deadline,
      this.status,
      this.priority,
      this.tag,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    active = json['active'];
    name = json['name'];
    description = json['description'];
    deadline = json['deadline'];
    status = json['status'];
    priority = json['priority'];
    tag = json['tag'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['user_id'] = userId;
    data['active'] = active;
    data['name'] = name;
    data['description'] = description;
    data['deadline'] = deadline;
    data['status'] = status;
    data['priority'] = priority;
    data['tag'] = tag;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
