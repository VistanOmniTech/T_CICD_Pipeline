from django.shortcuts import render


def home(request):
	return render(request, 'T_CICD_app/home.html')
