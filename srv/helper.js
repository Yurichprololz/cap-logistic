const getAverageRating = (rating) => {
  const arr = rating.map((rate) => Number(rate.rate_value))
  const average = arr.reduce((a, b) => a + b, 0) / arr.length;
  return average.toFixed(1)
}

module.exports = { getAverageRating }