select *
from PortfolioProject.dbo.CovidDeaths$

select *
from PortfolioProject.dbo.covidvaccinations$

select location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject.dbo.CovidDeaths$
order by 1,2

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject.dbo.CovidDeaths$
order by 1,2

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject.dbo.CovidDeaths$
where location like '%States%'
order by 1,2

select location, date, population, total_cases, total_deaths, (total_cases/population)*100 as InfectionPercentage
from PortfolioProject.dbo.CovidDeaths$
where location like '%Kenya%'

select location, MAX(cast(total_deaths as int )) as TotalDeathCount
from PortfolioProject.dbo.CovidDeaths$
where continent is not null
Group by location, continent
Order by TotalDeathCount desc


select location, date, total_cases, total_deaths, (cast(total_deaths as int)/total_cases)*100 as DeathPercentage
from PortfolioProject.dbo.CovidDeaths$
order by 1,2

select SUM(new_cases) as total_cases ,SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
from PortfolioProject.dbo.CovidDeaths$
order by 1,2

select dea.continent,dea.location, dea.population, vac.new_vaccinations
,SUM(cast(vac.new_vaccinations as int)) OVER(Partition by dea.location) as RollingVaccinated
from PortfolioProject.dbo.CovidDeaths$ dea
join PortfolioProject.dbo.covidvaccinations$ vac
   on dea.location = vac.location
   and dea.date = vac.date
where dea.continent is not null
order by 2,3

select dea.continent,dea.location, dea.population, vac.new_vaccinations
,SUM(cast(vac.new_vaccinations as int)) OVER(Partition by dea.location) as RollingVaccinated
from PortfolioProject.dbo.CovidDeaths$ dea
join PortfolioProject.dbo.covidvaccinations$ vac
   on dea.location = vac.location
   and dea.date = vac.date
where dea.continent is not null
order by 2,3

 