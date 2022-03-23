#include <bits/stdc++.h>
using namespace std;

string filename, fileWeights;
vector<vector<double> > Weights, points;
int n, nobj, nw;
void load_weigths(){
    Weights.assign(nw, vector<double> (nobj,0));
    std::ifstream readf(filename.c_str());
    for(int i=0; i< nw; i++){
        for(int j=0; j<nobj; j++){
         readf>>Weights[i][j];
        }
    }
    readf.close();
}
double fitness(vector<double>&namda, vector<double> &y_obj){
   double max_fun = -1.0e+30;
   for(int n=0; n<nobj; n++){
       double diff = fabs(y_obj[n]);
       double feval;
       if(namda[n]==0) 
           feval = diff/0.0001;
       else
           feval = diff/namda[n];
          if(feval>max_fun) max_fun = feval;
    }
    return max_fun;
}
double R2_Indicator(){
	double r2mean=0.0;
	for(int i = 0; i < nw; i++){
           double minv=DBL_MAX;
	   for(int j = 0; j < n; j++)
	      minv=min(minv, fitness(Weights[i], points[j]));
	   r2mean +=minv;
	}
	return r2mean/nw;
}
void inputArg(int argc, char **argv)
{
   for(int i = 1; i < argc ; i++)
   {
      string Terminal(argv[i]);
      if(Terminal == "--filePoints" )
         filename = string(argv[++i]);
      else if(Terminal == "--n" )
         n = atof(argv[++i]);
      else if(Terminal == "--nobj" )
         nobj = atof(argv[++i]);
      else if(Terminal == "--nw" )
         nw = atof(argv[++i]);
      else if(Terminal == "--fileWeights" )
         fileWeights= string(argv[++i]);
   }
}
void readpoints(vector<vector<double> > &data, string fname)
{
   FILE *fin = fopen(fname.c_str(), "r");
   nobj=0;
   int end=1, r=0, c=0;
   double num;
   char trimm[2];
   do //each row
   {
      vector<double> row;
      c = 0;
      do //each column
      {
	double p;
        fscanf(fin, "%lf", &p);
	row.push_back(p);
        fscanf(fin, "%*[ \t]");
        end = fscanf (fin, "%1[\r\n]", trimm);
        c++;
      }while(!end);
      nobj = max(nobj, c);
      data.push_back(row);
      //skip over successive empty lines
  do {
       if(!fscanf (fin, "%1[#]%*[^\n\r]", trimm))
            fscanf (fin, "%*[ \t]");
       end = fscanf (fin, "%1[\r\n]", trimm);
     } while (end == 1);
     r++;
   }while(end!= EOF);
   nobj = c;
   //size = r;
}
int main(int argc, char **argv){
   inputArg(argc, argv);
   readpoints(Weights, fileWeights);
   readpoints(points, filename);
   n=points.size();
   nobj=points[0].size();
   nw=Weights.size();
   cout << R2_Indicator() <<endl;

}
