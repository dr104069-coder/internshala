<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submit Review | SmartIntern</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body{
        background: linear-gradient(135deg,#1e3c72,#2a5298);
        min-height:100vh;
    }

    .card{
        border-radius:15px;
    }

    .star-rating input {
        display:none;
    }

    .star-rating label {
        font-size: 25px;
        color: #ccc;
        cursor: pointer;
    }

    .star-rating input:checked ~ label {
        color: gold;
    }

    .star-rating label:hover,
    .star-rating label:hover ~ label {
        color: gold;
    }
</style>

</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg p-4">
                
                <h4 class="text-center mb-4">Submit Internship Review</h4>

                <form action="saveReview" method="post">

                    <!-- Internship ID (FK) -->
                    <input type="hidden" name="internshipId" value="${internshipId}">
                    
                    <!-- Student ID (FK from session ideally) -->
                    <input type="hidden" name="studentId" value="${studentId}">

                    <!-- Rating -->
                    <div class="mb-3">
                        <label class="form-label">Rating</label>
                        <div class="star-rating d-flex flex-row-reverse justify-content-center">
                            
                            <input type="radio" name="rating" value="5" id="5"><label for="5"><i class="bi bi-star-fill"></i></label>
                            <input type="radio" name="rating" value="4" id="4"><label for="4"><i class="bi bi-star-fill"></i></label>
                            <input type="radio" name="rating" value="3" id="3"><label for="3"><i class="bi bi-star-fill"></i></label>
                            <input type="radio" name="rating" value="2" id="2"><label for="2"><i class="bi bi-star-fill"></i></label>
                            <input type="radio" name="rating" value="1" id="1" required><label for="1"><i class="bi bi-star-fill"></i></label>

                        </div>
                    </div>

                    <!-- Comment -->
                    <div class="mb-3">
                        <label class="form-label">Comment</label>
                        <textarea name="comment" 
                                  class="form-control" 
                                  rows="4"
                                  placeholder="Share your experience..."
                                  required></textarea>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">
                            Submit Review
                        </button>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>

</body>
</html>
