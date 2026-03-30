<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Applications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-4">

    <h2 class="mb-4">My Applications</h2>

   <table class="table table-bordered table-hover">

    <thead class="table-dark">
        <tr>
            <th>SR No.</th>
            <th>Internship Name</th>
            <th>Status</th>
            <th>Applied Date</th>
        </tr>
    </thead>

    <tbody>
        <c:forEach items="${applications}" var="app" varStatus="status">
            <tr>

                <!-- ✅ SR No -->
                <td>${status.count}</td>

                <!-- ✅ Internship Name -->
                <td>${app.internship.title}</td>

                <!-- ✅ Status -->
                <td>${app.applicationStatus}</td>

                <!-- ✅ Applied Date -->
                <td>${app.appliedAt}</td>

            </tr>
        </c:forEach>
    </tbody>

</table>

</div>

</body>
</html>