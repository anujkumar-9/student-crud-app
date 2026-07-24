console.log("SCRIPT LOADED SUCCESSFULLY");

async function loadStudents() {

    console.log("Loading students...");

    try {

        const response = await fetch("/users");

        console.log(response);

        const students = await response.json();

        console.log(students);

        const table = document.getElementById("studentTable");
        const counter = document.getElementById("studentCount");

        counter.innerHTML = students.length;

        table.innerHTML = "";

        students.forEach(student => {

            table.innerHTML += `
                <tr>
                    <td>${student.name}</td>
                    <td>${student.email}</td>
                    <td>
                        <button onclick="showDetails('${student._id}','${student.name}','${student.email}')">
                            👁 Details
                        </button>

                        <button onclick="deleteStudent('${student.email}')">
                            🗑 Delete
                        </button>
                    </td>
                </tr>
            `;

        });

    }

    catch(err){

        console.error(err);

    }

}

function showDetails(id, name, email) {

    document.getElementById("detailId").innerText = id;
    document.getElementById("detailName").innerText = name;
    document.getElementById("detailEmail").innerText = email;


    document.getElementById("detailsModal").style.display = "block";

}

function closeModal() {

    document.getElementById("detailsModal").style.display = "none";

}

async function deleteStudent(email) {

    const confirmDelete = confirm("Are you sure you want to delete this student?");

    if (!confirmDelete) {
        return;
    }

    try {

        const response = await fetch(`/delete/${email}`, {
            method: "DELETE"
        });

        const result = await response.json();

        alert(result.message);

        loadStudents();

    } catch (error) {

        console.error(error);

        alert("Delete failed.");

    }

}

loadStudents();
window.onclick = function(event) {

    const modal = document.getElementById("detailsModal");

    if (event.target == modal) {

        modal.style.display = "none";

    }

}
