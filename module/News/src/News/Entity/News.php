<?php

namespace News\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * News
 *
 * @ORM\Table(name="news", indexes={@ORM\Index(name="IDX_1DD3995064C19C1", columns={"category"})})
 * @ORM\Entity
 */
class News
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="bigint", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="news_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created", type="datetime", nullable=false)
     */
    private $created;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="updated", type="datetime", nullable=false)
     */
    private $updated;

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=255, nullable=false)
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="preview_text", type="text", nullable=true)
     */
    private $previewText;

    /**
     * @var string
     *
     * @ORM\Column(name="full_text", type="text", nullable=false)
     */
    private $fullText;

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_public", type="boolean", nullable=false)
     */
    private $isPublic = false;

    /**
     * @var \News\Entity\Category
     *
     * @ORM\ManyToOne(targetEntity="News\Entity\Category")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="category", referencedColumnName="id")
     * })
     */
    private $category;



    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set created
     *
     * @param \DateTime $created
     *
     * @return News
     */
    public function setCreated($created)
    {
        $this->created = $created;

        return $this;
    }

    /**
     * Get created
     *
     * @return \DateTime
     */
    public function getCreated()
    {
        return $this->created;
    }

    /**
     * Set updated
     *
     * @param \DateTime $updated
     *
     * @return News
     */
    public function setUpdated($updated)
    {
        $this->updated = $updated;

        return $this;
    }

    /**
     * Get updated
     *
     * @return \DateTime
     */
    public function getUpdated()
    {
        return $this->updated;
    }

    /**
     * Set title
     *
     * @param string $title
     *
     * @return News
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title
     *
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set previewText
     *
     * @param string $previewText
     *
     * @return News
     */
    public function setPreviewText($previewText)
    {
        $this->previewText = $previewText;

        return $this;
    }

    /**
     * Get previewText
     *
     * @return string
     */
    public function getPreviewText()
    {
        return $this->previewText;
    }

    /**
     * Set fullText
     *
     * @param string $fullText
     *
     * @return News
     */
    public function setFullText($fullText)
    {
        $this->fullText = $fullText;

        return $this;
    }

    /**
     * Get fullText
     *
     * @return string
     */
    public function getFullText()
    {
        return $this->fullText;
    }

    /**
     * Set isPublic
     *
     * @param boolean $isPublic
     *
     * @return News
     */
    public function setIsPublic($isPublic)
    {
        $this->isPublic = $isPublic;

        return $this;
    }

    /**
     * Get isPublic
     *
     * @return boolean
     */
    public function getIsPublic()
    {
        return $this->isPublic;
    }

    /**
     * Set category
     *
     * @param \News\Entity\Category $category
     *
     * @return News
     */
    public function setCategory(\News\Entity\Category $category = null)
    {
        $this->category = $category;

        return $this;
    }

    /**
     * Get category
     *
     * @return \News\Entity\Category
     */
    public function getCategory()
    {
        return $this->category;
    }
}
