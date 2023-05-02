module CategoryQuery
    extend ActiveSupport::Concern
    include BaseQuery
  
    included do
      extend ClassMethods
    end
  
    module ClassMethods
      # Formata os parâmetros recebidos para um formato adequado para ser utilizado pelo Ransack.
      def format_params(params)
        return {} unless params
  
        {
          id_eq: params[:id],
          name_cont: params[:title],
        }
      end
  
      # Formata a ordem de classificação dos resultados.
      # Se nenhum parâmetro de ordem é especificado, a ordenação padrão é por ID em ordem decrescente (da maior para a menor).
      def format_order(order = '')
        return Arel.sql(order) if order.present?
  
        [Arel.sql('id DESC NULLS LAST')]
      end
    end
end
