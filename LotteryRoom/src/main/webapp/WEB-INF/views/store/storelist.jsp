<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>

@import url('https://fonts.googleapis.com/css2?family=Hahmlet&display=swap');

.market {
	font-weight : bold;
	color: green;
}
.address{
	font-weight: bold;
}
.buttonPosition{
	font-size: 16px;
    color: #007BFF;
    background-color: white;
    border: 2px solid #007BFF;
    cursor: pointer;
    text-align: center;
    display: inline-block;
    transition-duration: 0.4s;
}
.buttonPosition:hover{
	color:white;
	background-color: #007BFF;
}
/* Outlined Button */
.outlinedButton {
    font-size: 16px;
    padding: 10px 20px;
    color: #007BFF;
    background-color: white;
    border: 2px solid #007BFF;
    cursor: pointer;
    text-align: center;
    display: inline-block;
    transition-duration: 0.4s;
    margin-right: 10px;
}

.outlinedButton:hover {
    color: white;
    background-color: #007BFF;
}

.Select {
    padding: 10px 20px;
    font-size: 16px;
    color: #0066ff;
}


.button-container {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 10px;
}

.data-row {
	display: flex;
	justify-content: center;
}

.button-container button {
	margin-left: 10px;
}

h1 {
	text-align: center;
}

.data-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	margin: 0 -10px; /* 좌우 여백 조정 */
}

.data-item {
	flex-basis: calc(20% - 25px);
	padding: 10px;
	border: 1px solid #ccc;
	background-color: #f5f5f5;
	margin: 10px; /* 아이템 간격 조정 */
	width: calc(100% - 50px);
}

.data-item .image-container {
	width: 100%;
	
	margin-bottom: 10px;

}

.data-item img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	justify-content: center;
}

.item {
	padding: 10px;
	border: 1px solid #ccc;
	background-color: #f5f5f5;
	margin-right: 10px;
}

#images {
	width: 300px;
	height: 300px;
	display:block;
}

.pagination-container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.pagination-container button {
	margin: 0 5px;
	font-size: 16px;
    padding: 12px 24px;
    color: white;
    background-color: #00b359;
    border: none;
    cursor: pointer;
    text-align: center;
    display: inline-block;
    transition: all 0.3s ease-out;
    position: relative;
    overflow: hidden;
    border-radius: 4px;
}
.pagination-container button:hover {
    background-color: #0056b3;
}
.pagination-container button:after {
    content: "";
    position: absolute;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: #007BFF;
    border-radius: 4px;
    z-index: 1;
    transition: all 0.3s ease-in-out;
    transform: scale(0);
    transform-origin: center;
}
.pagination-container button:before {
    z-index: 2;
    position: relative;
}
.pagination-container button:active:after{
	transform: scale(1);
}
.h2c {
	display:inline-block;
}
.sung {
	width: 50px;
	height:50px;
	display:inline-block;
}

</style>
<head>
<meta charset="UTF-8">
<title>복권 판매점</title>
</head>

<body>
	<img src="./images/현용이형.png" class="sung"><h2 class="h2c" style="font-family: 'Hahmlet', serif;">복권 판매점 위치 조회</h2><img src="./images/성현이.png" class="sung">
	<hr>
	<div class="button-container">
		<select class="Select" id="Select">
			<option value="">전체보기</option>
			<option value="서울">서울</option>
			<option value="경기">경기</option>
			<option value="전북">전북</option>
			<option value="경남">경남</option>
			<option value="대구">대구</option>
			<option value="경북">경북</option>
			<option value="인천">인천</option>
			<option value="대전">대전</option>
			<option value="강원">강원</option>
			<option value="제주">제주</option>
			<option value="울산">울산</option>
			<option value="부산">부산</option>
		</select>
	<button id="searchBtn" class="outlinedButton">조회</button>
	</div>
	<div id="data-container"></div>
	<div class="pagination-container"></div>
	<script>
			let showFields = ['상호','지번주소'];
		let url =`https://api.odcloud.kr/api/15086355/v1/uddi:6e004f0c-7901-4bbc-a3d1-84a9f718d1bb?page=1&perPage=6947&serviceKey=%2BxWYdMG99hG7MIa%2BTwNPBSgGDUzfPQ9RKVv0LDk6vzVzJgHEPlJN8kXs527%2FnaAdFtjNilppUR949tZMMgpdBA%3D%3D`
			 let dataContainer = document.querySelector('#data-container');
		  let paginationContainer = document.querySelector('.pagination-container');
		  let currentPage = 1;
		  let itemsPerPage = 9;
		  let filtereData;
		  let allCenter;
		  let totalPages = 0;

		/*=======================전 체 리 스 트 조 회===========================*/
			 fetch(url)
    .then(resolve => resolve.json())
    .then(result => {
      allCenter = result.data;
      filteredData = allCenter;
      let totalPages = Math.ceil(allCenter.length / itemsPerPage);
      renderData(currentPage);
      renderPagination(totalPages);
    })
    .catch(error => console.error(error));
		
		/*====================== R O W 생 성 ===========================*/	
		function makeRow(center = []) {
		    let row = document.createElement('div');
		    row.classList.add('data-row');
		
		    center.forEach(centerData => {
		      let item = document.createElement('div');
		      item.classList.add('data-item');
		
		      let imageContainer = document.createElement('div');
		      imageContainer.classList.add('image-container');
		
		      let image = document.createElement('img');
		      image.id = 'images';
		      image.src = './images/복권방로고.png';
		      image.alt = '이미지';
		      imageContainer.appendChild(image);
		      item.appendChild(imageContainer);
		
		      let name = document.createElement('div');
		      name.classList.add('market')
		      name.innerText = centerData.상호;
		      item.appendChild(name);
		
		      let location = document.createElement('div');
		      location.classList.add('address')
		      location.innerText = centerData.지번주소;
		      item.appendChild(location);
		
		      let button = document.createElement('button');
		      button.classList.add('buttonPosition')
		      button.innerText = '위치찾기';
		      button.addEventListener('click', function () {
		        let encodedAddress = encodeURIComponent(centerData.지번주소);
		        let url = 'storemap.do?addr=' + encodedAddress + '&sname=' + centerData.상호;
		        window.location.href = url;
		      });
		      item.appendChild(button);
		      row.appendChild(item);
		    });
		    return row;
		  }
	
			/*====================== G R O U P  D A T A ===========================*/
			function groupData(data = [], size) {
		   	 let groups = [];
		    for (let i = 0; i < data.length; i += size) {
		      groups.push(data.slice(i, i + size));
		    }
		    return groups;
		  }

			/*=======================조 회 이 벤 트 ===========================*/
			document.querySelector('#searchBtn').addEventListener('click', function () {
			    let searchKey = document.getElementById('Select').value;
			    findList(searchKey);
			  });
			/*=======================지 역 별 조 회===========================*/
			function findList(Select = '') {
			  dataContainer.innerHTML = '';
			  filteredData = allCenter.filter(center => {
			    return center.도로명주소.startsWith(Select.substring(0, 3));
			  });
			  currentPage = 1;
			  totalPages = Math.ceil(filteredData.length / itemsPerPage);
			  renderData(currentPage, filteredData);
			  renderPagination(totalPages);
			}
			/*=======================페이징 함수===========================*/
			function renderPagination(totalPages) {
			    paginationContainer.innerHTML = '';
			    const maxButtons = 5;
			    let startPage = 1;
			    let endPage = Math.min(startPage + maxButtons - 1, totalPages);
			
			    if (currentPage > Math.floor(maxButtons / 2)) {
			      startPage = currentPage - Math.floor(maxButtons / 2);
			      endPage = startPage + maxButtons - 1;
			      if (endPage > totalPages) {
			        endPage = totalPages;
			        startPage = endPage - maxButtons + 1;
			      }
			    }
			  
			// "<<" 버튼
			  let prevButton = document.createElement('button');
			  prevButton.innerText = '<<';
			  prevButton.addEventListener('click', function () {
			    currentPage = 1;
			    renderData(currentPage, filteredData.length > 0 ? filteredData : allCenter);
			    renderPagination(totalPages);
			  });
			  paginationContainer.appendChild(prevButton);

			  for (let i = startPage; i <= endPage; i++) {
			    let button = document.createElement('button');
			    button.innerText = i;
			    button.addEventListener('click', function () {
			      currentPage = i;
			      renderData(currentPage, filteredData.length > 0 ? filteredData : allCenter);
			    });
			    paginationContainer.appendChild(button);
			  }

			  // ">>" 버튼
			  let nextButton = document.createElement('button');
			  nextButton.innerText = '>>';
			  nextButton.addEventListener('click', function () {
			    currentPage = totalPages;
			    renderData(currentPage, filteredData.length > 0 ? filteredData : allCenter);
			    renderPagination(totalPages);
			  });
			  paginationContainer.appendChild(nextButton);
			}
			
			/*=======================데이터 출력 함수===========================*/
			function renderData(page) {
			  dataContainer.innerHTML = '';
			  let startIndex = (page - 1) * itemsPerPage;
			  let endIndex = startIndex + itemsPerPage;
			  let rowData = filteredData.slice(startIndex, endIndex);
			  let groupedData = groupData(rowData, 3);
			  groupedData.forEach(group => {
			    let row = makeRow(group);
			    dataContainer.append(row);
			  });
			  renderPagination(Math.ceil(filteredData.length / itemsPerPage));
			}
	</script>
</body>
</html>