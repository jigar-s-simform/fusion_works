class PaginationModel<T> {
  const PaginationModel({
    required this.list,
    required this.totalCount,
  });

  final List<T> list;
  final int totalCount;
}
