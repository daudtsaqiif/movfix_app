part of 'pages.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key, this.review, this.movie});

  final Movie? movie;
  final Review? review;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  void initState() {
    context.read<ReviewCubit>().getReview(widget.movie!.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ReviewCubit, ReviewState>(builder: (context, state) {
              if (state is ReviewLoaded) {
                List<Review> reviews = state.reviews;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: reviews.length.clamp(0, 10),
                  itemBuilder: (context, index) {
                    final review = reviews[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8, bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.8),
                            width: 0.8,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align content to the left
                            children: [
                              ListTile(
                                // Use ListTile for better structure
                                leading: CircleAvatar(
                                  // Make avatar circular
                                  backgroundImage: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500/${review.avatar ?? ''}", // Handle null avatar
                                  ),
                                ),
                                title: Text(
                                  review.author ?? 'No Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  review.content ??
                                      'No Content', // Display review content
                                  maxLines: 3, // Limit content lines
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
      
                              // Optional: display rating
                              if (review.rating != null)
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text(review.rating!.toStringAsFixed(1)),
                                  ],
                                ),
                            ]),
                      ),
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            })
          ],
        ),
      ),
    );
  }
}
