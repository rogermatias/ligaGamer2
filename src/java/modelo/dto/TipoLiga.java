/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dto;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Duoc
 */
@Entity
@Table(name = "tipo_liga")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoLiga.findAll", query = "SELECT t FROM TipoLiga t")
    , @NamedQuery(name = "TipoLiga.findById", query = "SELECT t FROM TipoLiga t WHERE t.id = :id")
    , @NamedQuery(name = "TipoLiga.findByDescripcion", query = "SELECT t FROM TipoLiga t WHERE t.descripcion = :descripcion")
    , @NamedQuery(name = "TipoLiga.findByVigente", query = "SELECT t FROM TipoLiga t WHERE t.vigente = :vigente")})
public class TipoLiga implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "vigente")
    private int vigente;
    @ManyToMany(mappedBy = "tipoLigaList")
    private List<Equipo> equipoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoLiga")
    private List<Equipo> equipoList1;

    public TipoLiga() {
    }

    public TipoLiga(Integer id) {
        this.id = id;
    }

    public TipoLiga(Integer id, String descripcion, int vigente) {
        this.id = id;
        this.descripcion = descripcion;
        this.vigente = vigente;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getVigente() {
        return vigente;
    }

    public void setVigente(int vigente) {
        this.vigente = vigente;
    }

    @XmlTransient
    public List<Equipo> getEquipoList() {
        return equipoList;
    }

    public void setEquipoList(List<Equipo> equipoList) {
        this.equipoList = equipoList;
    }

    @XmlTransient
    public List<Equipo> getEquipoList1() {
        return equipoList1;
    }

    public void setEquipoList1(List<Equipo> equipoList1) {
        this.equipoList1 = equipoList1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoLiga)) {
            return false;
        }
        TipoLiga other = (TipoLiga) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.TipoLiga[ id=" + id + " ]";
    }
    
}
