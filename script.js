document.addEventListener("DOMContentLoaded", () => {
  // ヘッダーを読み込む
  fetch("header.html")
      .then(response => response.text())
      .then(data => {
          document.getElementById("header-placeholder").innerHTML = data;

          // ヘッダーの読み込みが終わってからイベントリスナーを設定
          const menuToggle = document.querySelector(".menu-toggle");
          const mobileNav = document.querySelector(".mobile-nav");

          if (menuToggle && mobileNav) {
              menuToggle.addEventListener("click", function () {
                  mobileNav.style.display = (mobileNav.style.display === "block") ? "none" : "block";
              });
          }
      });

  // フッターを読み込む
  fetch("footer.html")
      .then(response => response.text())
      .then(data => document.getElementById("footer-placeholder").innerHTML = data);
});



document.addEventListener("DOMContentLoaded", function () {
  const ctx = document.getElementById("memberChart").getContext("2d");

  new Chart(ctx, {
      type: "doughnut",
      data: {
          labels: ["30%", "20%", "30%", "20%"],
          datasets: [{
              data: [30, 20, 30, 20],
              backgroundColor: ["blue", "lightblue", "pink", "red"],
              borderWidth: 1
          }]
      },
      options: {
          responsive: true,
          maintainAspectRatio: false,
          cutout: "50%",
          plugins: {
              legend: {
                  display: false // デフォルトの凡例を非表示
              },
              tooltip: {
                  enabled: false // ツールチップをオフ
              },
              datalabels: {
                  color: "#fff",
                  font: {
                      weight: "bold",
                      size: 16
                  },
                  formatter: (value, ctx) => ctx.chart.data.labels[ctx.dataIndex]
              }
          }
      },
      plugins: [ChartDataLabels] // 数字を表示するためのプラグイン
  });
});


document.addEventListener("DOMContentLoaded", function () {
  const scrollContainers = document.querySelectorAll(".event-container");

  scrollContainers.forEach(container => {
      const leftBtn = container.parentElement.querySelector(".left-btn");
      const rightBtn = container.parentElement.querySelector(".right-btn");

      if (leftBtn && rightBtn) {
          leftBtn.addEventListener("click", () => {
              container.scrollBy({ left: -400, behavior: "smooth" });
          });

          rightBtn.addEventListener("click", () => {
              container.scrollBy({ left: 400, behavior: "smooth" });
          });
      }
  });
});

















// 年間予定データ（詳細情報付き、画像なし）
const events = [
  {
    month: "5月",
    event: "新歓合宿",
    description: "新年を祝いながら、初打ちを楽しみます。初心者も歓迎！"
  },
  {
    month: "8月",
    event: "夏合宿",
    description: "新入生とともに楽しいテニスイベントを開催します。"
  },
  {
    month: "9月",
    event: "秋合宿",
    description: "夏休み恒例の合宿！みんなでテニスを楽しみ、絆を深めます。"
  },
  {
    month: "12月",
    event: "白子合宿",
    description: "秋の大会で熱戦！日頃の練習の成果を発揮します。"
  },
  {
    month: "2月",
    event: "春合宿",
    description: "一年の締めくくりに楽しい忘年会を開催します。"
  }
];

// 年間予定詳細を表示する関数
function displayEventDetails(containerId) {
  try {
    const container = document.getElementById(containerId);
    if (!container) throw new Error(`コンテナID "${containerId}" が見つかりません。`);

    events.forEach(e => {
      const eventDiv = document.createElement('div');
      eventDiv.className = "event-detail";

      const title = document.createElement('h3');
      title.textContent = `${e.month}: ${e.event}`;

      const description = document.createElement('p');
      description.textContent = e.description;

      eventDiv.appendChild(title);
      eventDiv.appendChild(description);
      container.appendChild(eventDiv);
    });
  } catch (error) {
    console.error("年間予定の表示中にエラーが発生しました:", error.message);
  }
}

// ページ読み込み時にイベントを表示
document.addEventListener('DOMContentLoaded', () => {
  try {
    // 年間予定詳細を表示
    displayEventDetails('event-details');
  } catch (error) {
    console.error("初期化中にエラーが発生しました:", error.message);
  }
});

// 年間予定概要を表示する関数
function populateEventList(listId) {
  try {
    const list = document.getElementById(listId);
    if (!list) throw new Error(`リストID "${listId}" が見つかりません。`);

    events.forEach(e => {
      const listItem = document.createElement('li');
      listItem.textContent = `${e.month}: ${e.event}`;
      list.appendChild(listItem);
    });
  } catch (error) {
    console.error("年間予定リストの生成中にエラーが発生しました:", error.message);
  }
}

// ページ読み込み時にイベントを表示
document.addEventListener('DOMContentLoaded', () => {
  try {
    // 年間予定詳細を表示
    displayEventDetails('event-details');
    // 年間予定概要をリストに表示
    populateEventList('event-list');
  } catch (error) {
    console.error("初期化中にエラーが発生しました:", error.message);
  }
});






