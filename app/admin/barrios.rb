ActiveAdmin.register Barrio do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
menu parent: "Cliente", label: " Barrios"
# Campos permitidos para formulario
 permit_params :descripcion,  :activo

 controller do
   def destroy
     barrio = Barrio.find(params[:id])
     barrio.update_attribute(:activo, false)
     redirect_to admin_barrios_path
   end

<<<<<<< HEAD
    #def generate_pdf(barrio)
    #    pdf = WickedPdf.new.pdf_from_string(
    #      barrio.content,
    #      encoding: 'UTF-8',
    #      page_size: 'A4',
     #     orientation: 'Portrait',
     #     template: 'layouts/pdf.html.erb',
    #      margin:  {    top:               30,                     # default 10 (mm)
       # v                bottom:            30,
      #              bottom:            30,
    #                left:              20,
    #                right:             20
    #  },
    #  layout: 'layouts/pdf.html'
   # )
    #send_data(
      #pdf,
     # filename: "barrio_#{barrio.type_document}_#{barrio.admin_user.email}.pdf",
    #  disposition: 'attachment'
   # )
  #end


def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf:"PDF-de-#{@barrio.id}",
        header: {
          center: "Codigo Facilito"
        },
        footer: {
          center: "www.codigofacilito.com"
        },
        layout: 'layouts/pdf.html.erb',
        page_size: 'letter',
        file:'layouts/show.pdf.erb'
      end
    end
  end

 end




# action_item :view, only: :show do
#   link_to 'Atras', admin_barrios_path
# end

 # Link para activar registro
 #action_item :activado, only: :show do
#   link_to "Activar", activado_admin_barrio_path(barrio), method: :put if !barrio.activo
 #end
=======
   def pdf(barrio)
     barrio.all
     respond_to do |format|
      format.html
      format.json
      format.pdf{render template: 'barrio/reporte', pdf: 'barrio/reporte', layouts: 'layouts/pdf.html'}
      end
   end

 end

#index download_links: [:pdf]
 action_item :view, only: :show do
   link_to 'Atras', admin_barrios_path
 end

  # Funcion para activar registro
  member_action :pdf, method: :put do
    barrio = Barrio.find(params[:id])
    respond_to do |format|
     format.html
     format.json
     format.pdf{render template: 'barrio/pdf', pdf: 'reporte', layouts: 'pdf.html'}
     end
  end

 # Link para descargar pdf
 action_item :pdf, only: :show do
   link_to "Descargar PDF", pdf_admin_barrio_path(barrio)
 end

>>>>>>> ff0a83b8dea13022e7fb02aa59e8050839681f14
 # Funcion para activar registro
 member_action :activado, method: :put do
 sub_category = Barrio.find(params[:id])
 sub_category.update(activo: true)
 redirect_to admin_barrios_path
 end
 # Link para activar registro
 action_item :activar, only: :show do
   link_to "Activar", activado_admin_barrio_path(barrio), method: :put if !barrio.activo
 end


# lista segun activo o no
 scope :inactivo
 scope :activo, :default => true
 scope :todos

# filtros de busqueda
 filter :descripcion

# tabla de index
 index title: "Barrios" do
 	 column "Descripcion", :descripcion
	 column "Creado", :created_at
   actions  do |barrio|
     #link_to("Mostrar", admin_barrio_path(client)) + " | " + \
     #link_to("Editar", edit_admin_barrio_path(client)) + " | " + \
     #link_to("Eliminar", admin_barrio_path(client), :method => :delete, :confirm => "Are you sure?")
<<<<<<< HEAD
     link_to 'Create PDF document',admin_barrios_path(client, format: :pdf)

=======
      link_to "Descargar PDF", pdf_admin_barrio_path(barrio)
>>>>>>> ff0a83b8dea13022e7fb02aa59e8050839681f14
   end
 end

 # Formulario personalizado
 form title: 'Barrios' do |f|
     inputs 'Detalles' do
       input :descripcion, label: "Descripcion"
     end
     actions
   	end

# Vista show
 show title: "Barrio"  do
   attributes_table do
     row :descripcion
     row :activo
     row :created_at
   end
 end


end
