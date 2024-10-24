class PhotosController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  before_action :set_photo, only: [ :show ]
  before_action :authorize_admin!, only: [ :new, :create ]

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to photos_path, notice: "Foto subida exitosamente."
    else
      render :new
    end
  end

  def index
    @photos = Photo.all.includes(:user)
  end

  def show; end

  private

  def photo_params
    params.require(:photo).permit(:image, :caption)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def authorize_admin!
    redirect_to photos_path, alert: "No tienes permiso para realizar esta acción." unless current_user.admin?
  end
end
