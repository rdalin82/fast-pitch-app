/* global Vue, $ */
document.addEventListener("DOMContentLoaded", function(event) {
  var app = new Vue({
    el: '#app',
    data: {
      message: "hello vue!",
      presenters: [],
      scores: [],
      ranks: [],
      newFinalRank: "",
      nameFilter: "",
      sortAttribute: "name",
      sortAscending: true
    },
    computed: {
      filteredPresenters: function() {
        var filtered = this.presenters.filter(function(presenter) {
          var lowerName = presenter.name.toLowerCase();
          return lowerName.indexOf(lowerNameFilter) !== -1;
        });
        var sorted = filtered.sort(function(presenter1, presenter2) {
          if (this.sortAscending) {
            // return presenter1[this.sortAttribute] > presenter2[this.sortAttribute];
            return presenter1[this.sortAttribute].localeCompare(presenter2[this.sortAttribute]);
          } else {
            // return presenter1[this.sortAttribute] < presenter2[this.sortAttribute];
            return presenter2[this.sortAttribute].localeCompare(presenter1[this.sortAttribute]);
          }
        }.bind(this));
        return sorted;
      }
    },
    mounted: function() {
      $.get("/api/v1/final_ranks", function(responseData) {
        this.final_ranks = responseData;
      }.bind(this));
    },
    methods: {
      setSortAttribute: function(inputAttribute) {
        if (inputAttribute === this.sortAttribute) {
          this.sortAscending = !this.sortAscending;
        } else {
          this.sortAscending = true;
        }
        this.sortAttribute = inputAttribute;
      },
      addFinalRank: function() {
        this.errors = [];
        var params = {name: this.newFinalRank};
        $.post("/api/v1/final_ranks", params, function(responseData) {
          this.finalRank.push(responseData);
          this.newfinalRank = "";
        }.bind(this)).fail(function(response) {
          this.errors = response.responseJSON.errors;
        }.bind(this));
      }
    }
  });
});
