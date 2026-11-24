Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550086;
	b=qMO/6hCJs6V4NdLSzEFYjfckxA0jAltxekPIPlYnSoo+xpcuZNWNYL21Agxio35nplpP
	 L2EebYzYVf7ZVQbpfNdbdlwp+JCb1X8hdQ7QjrQGL+ABPcg7hIL1Udh2xjFalLBUSzs78
	 mcUrfP2LGfToMaoXsY504UdSSnZHVeDao/Po17hkoVOckonlkTtwu96GaGrRm/sXiXxyG
	 aiQS9lcDoc8iFajaCL/IWBe1wIUGsfUL5Yt12kghPFGaMN3BEk8EIE0FY4Gflx0R+YuPM
	 4CF7FNjfEUFh4o03BZbwsCYaps7TMFp8Ilix1MfAcVLl/SQqvcA7AWDgHe1djmif5tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BDVHI7DTLc1+JGkYVDzC7pa7UnD9siLvUvtQtAbIKnU=;
	b=DA4aE2YlDG43pS9lPxVj3dDYNaY/jH31REcn+HMFt3WNkLnMIRXJdv01TrB6MvByyjdm
	 wSu86fHWsPMAAue7b7eywDkRlHi406VclHgLuPJ3TbqCYDot/Y5VA88xWcCu0rpnNwIHs
	 TZ6D+fG6t3S9uFTAeAoo+6ZFFV+yX0WRpCdcsXtCXtEemIx8XwB10lkNdopurkFMa9SB0
	 7Ed7eI0/zXQbSwTB5eJ5TKig5bnQfBipHlx3C1rLcZ0h2kGCD2LrTsodwITOhp6tlJCjb
	 xrMF1NhOG/TUtKgjGjOLjnhgJKh0alW8PGGfxFbwVJScwzQRGmU0HyaZIlLEi/IaK5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZdHquAV;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC7B606A329
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 19:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC7B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZdHquAV
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2610822f8f.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 11:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795550084; x=1796154884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BDVHI7DTLc1+JGkYVDzC7pa7UnD9siLvUvtQtAbIKnU=;
        b=IZdHquAVRVWq2fKL8lTU7N6QrUZevcsyO3KDvjtCD2V2llzvdnmfbR92j5n71j7IoR
         0958kNSjkvYzDsGss5qmanvkBE1SeMjgeMrPqsA2bKaSfztmHEjReUewOuDu2uHQ9O4L
         xdPn7rMw0PtimcNIzXJOJdX8WSFP83yVMJUlPmuTnpYXA2jwn+65anIL9fphsutELPUm
         nRlfra8L6rrE7NkMY78NshIY7FCsXilG/zLpwT8YHv1SMnRjPTOM0bh+LnK4rhSJxHbQ
         LOcDSw6EQ18OiSHozYU2jf0JVqDnyGT1NsrtnmqgZXn15LwaxmsKuBrGCh8MU3fS2dKW
         0K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550084; x=1796154884;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BDVHI7DTLc1+JGkYVDzC7pa7UnD9siLvUvtQtAbIKnU=;
        b=ctM0dIQXJD0UGkVbkdsDXuAFD4oe4FN6a5baDExD88kcaOIucUBLPDjfZq9Io92nAk
         RCTguB4nOhEOi5k3/Y01u9RT/MExLxoDlizFyiUWQSMYjbG62sV01AQ8r33lMb12EML9
         lEi7CEe+EdV3zmU4VWPlWrozwAOqp4RnqDKMHnX2UOqZkGyu/qln/FyXKxKXffpnEHt7
         hcxcdkb5XTMaVQ6LWJqX/1m2/Euze+RU206ZqlH1I04HFXRgvJlNJgGz7ONiNppkCAsR
         AhN1qcRYuyJeXVNGbdkS4uPEzpmMSNWW3Kpbax4fL3B/Ffrxf5CWutOuFtxs+vn7diIT
         yVxQ==
X-Gm-Message-State: APuU4Z9xsckoQZylyAabqzIPWfdwz120xdSvqLcyZYz1JZDnFQeqjjY7
	ZKG51/x4okxU2dC0qSY6WrPpbrE9N4Vp1iGMJT0hGGv1iaCiWjKFu8obPXGrp12v
X-Gm-Gg: AZFdTZc3ifZPlEnPNm1TM+O8nr4N49jqtZ6YLAvOv63nUj1GwH97Hyg8WbQ/C7ZupEz
	XVUhE9h06LgdqVR/KI7eWk0+di3bLcWBJVT+LurDKFbVBIbUELv2zJrQg3Tu8Nq/ekYOvGfqJOi
	ckyyETJIDvwGcasgWEpo/kG9il8oHZSldi4gbHi44hZJTpfyUhw++fT3/lIlbxQT+kDZB1eB7MU
	4LaGXeT3adOHvvCvQhCfIEqj/hRbfUvMvzJCzhB9Bw6rbGZ3lDR7GE9RKZs0ZauavjSep3mtLN9
	YsJgOo5l0xpt66Om9gNSrUhO6Jq+HcrsO/iJRhGbkdIzKK1KGnZ7aO4r0AiopZz7wqzTHB2880D
	0644WNHoPvpzJvuEKgazKEEYy7PhBcHi4gJBGUKit/R3iPSMI3kE4ZoPgL5Mr4gii7bhUZFzmYp
	fE+c0kNf2EBRkW+RLZx4cfpm2jPhpaHV2txR4nKkMGYTzAmMYFsMnys6CQbK+dhYh07knT23RtE
	CIz805OxQSTBFiMyDO5zs3hsP028LCbHQ+GWxC0Q1fhdA8dpKqjAsmyl5Gt7Cig5UjHiLeGvF0V
	BitcKE2r0YtMIC6oORu8Knaq1+ilC1g+7Z0QZg==
X-Received: by 2002:a05:6000:3102:b0:4a8:9836:90c3 with SMTP id ffacd0b85a97d-4abaf7401f2mr30214194f8f.16.1795550084081;
        Tue, 24 Nov 2026 11:54:44 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm28991862f8f.30.2026.11.24.11.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:54:43 -0800 (PST)
Message-ID: <f7a9c585-3c3b-4818-a262-6c9f8103387a@gmail.com>
Date: Tue, 24 Nov 2026 21:54:42 +0200
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: Re: [PATCH rtw-next 4/5] wifi: rtw88: pci: Add functions to support
 older chips
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Cc: Ping-Ke Shih <pkshih@realtek.com>
References: <2033f1b1-fb12-4a04-aef4-923590e64463@gmail.com>
 <35e9d20a-4f0c-42c3-9d06-358a5620251c@gmail.com>
Content-Language: en-US
In-Reply-To: <35e9d20a-4f0c-42c3-9d06-358a5620251c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/10/2026 02:02, Bitterblue Smith wrote:
> Add pci_old.{c,h} to support older chips, like RTL8821AE and RTL8812AE.
> They handle the PCI communications differently.
> 
> Signed-off-by: Bitterblue Smith <rtl8821cerfe2@gmail.com>
> ---
>  drivers/net/wireless/realtek/rtw88/Makefile  |   2 +-
>  drivers/net/wireless/realtek/rtw88/pci.c     |   9 +-
>  drivers/net/wireless/realtek/rtw88/pci.h     |   6 +
>  drivers/net/wireless/realtek/rtw88/pci_old.c | 522 +++++++++++++++++++
>  drivers/net/wireless/realtek/rtw88/pci_old.h |  39 ++
>  drivers/net/wireless/realtek/rtw88/reg.h     |   3 +
>  drivers/net/wireless/realtek/rtw88/rx.h      |   4 +
>  drivers/net/wireless/realtek/rtw88/tx.h      |   5 +
>  8 files changed, 584 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/net/wireless/realtek/rtw88/pci_old.c
>  create mode 100644 drivers/net/wireless/realtek/rtw88/pci_old.h
> 
> diff --git a/drivers/net/wireless/realtek/rtw88/Makefile b/drivers/net/wireless/realtek/rtw88/Makefile
> index 6889b3796449..d4007ca2b2ca 100644
> --- a/drivers/net/wireless/realtek/rtw88/Makefile
> +++ b/drivers/net/wireless/realtek/rtw88/Makefile
> @@ -110,7 +110,7 @@ obj-$(CONFIG_RTW88_8814AU)	+= rtw88_8814au.o
>  rtw88_8814au-objs		:= rtw8814au.o
>  
>  obj-$(CONFIG_RTW88_PCI)		+= rtw88_pci.o
> -rtw88_pci-objs			:= pci.o
> +rtw88_pci-objs			:= pci.o pci_old.o
>  
>  obj-$(CONFIG_RTW88_SDIO)	+= rtw88_sdio.o
>  rtw88_sdio-objs			:= sdio.o
> diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
> index c51ad15cfba7..35f45e3ede81 100644
> --- a/drivers/net/wireless/realtek/rtw88/pci.c
> +++ b/drivers/net/wireless/realtek/rtw88/pci.c
> @@ -16,7 +16,7 @@
>  #include "mac.h"
>  
>  static bool rtw_disable_msi;
> -static bool rtw_pci_disable_aspm;
> +bool rtw_pci_disable_aspm;
>  module_param_named(disable_msi, rtw_disable_msi, bool, 0644);
>  module_param_named(disable_aspm, rtw_pci_disable_aspm, bool, 0644);
>  MODULE_PARM_DESC(disable_msi, "Set Y to disable MSI interrupt support");
> @@ -32,8 +32,7 @@ static const u32 rtw_pci_tx_queue_idx_addr[] = {
>  	[RTW_TX_QUEUE_H2C]	= RTK_PCI_TXBD_IDX_H2CQ,
>  };
>  
> -static u8 rtw_pci_get_tx_qsel(struct sk_buff *skb,
> -			      enum rtw_tx_queue_type queue)
> +u8 rtw_pci_get_tx_qsel(struct sk_buff *skb, enum rtw_tx_queue_type queue)
>  {
>  	switch (queue) {
>  	case RTW_TX_QUEUE_BCN:
> @@ -675,8 +674,8 @@ static void rtw_pci_deep_ps(struct rtw_dev *rtwdev, bool enter)
>  	spin_unlock_bh(&rtwpci->irq_lock);
>  }
>  
> -static void rtw_pci_release_rsvd_page(struct rtw_pci *rtwpci,
> -				      struct rtw_pci_tx_ring *ring)
> +void rtw_pci_release_rsvd_page(struct rtw_pci *rtwpci,
> +			       struct rtw_pci_tx_ring *ring)
>  {
>  	struct sk_buff *prev = skb_dequeue(&ring->queue);
>  	struct rtw_pci_tx_data *tx_data;
> diff --git a/drivers/net/wireless/realtek/rtw88/pci.h b/drivers/net/wireless/realtek/rtw88/pci.h
> index 5ab78ba3255d..92532f842ebc 100644
> --- a/drivers/net/wireless/realtek/rtw88/pci.h
> +++ b/drivers/net/wireless/realtek/rtw88/pci.h
> @@ -144,6 +144,8 @@
>  /* IMR 3 */
>  #define IMR_H2CDOK		BIT(16)
>  
> +extern bool rtw_pci_disable_aspm;
> +
>  enum rtw_pci_flags {
>  	RTW_PCI_FLAG_NAPI_RUNNING,
>  
> @@ -268,6 +270,10 @@ extern const struct dev_pm_ops rtw_pm_ops;
>  extern const struct pci_error_handlers rtw_pci_err_handler;
>  extern const struct rtw_pci_gen rtw_pci_gen_new;
>  
> +u8 rtw_pci_get_tx_qsel(struct sk_buff *skb, enum rtw_tx_queue_type queue);
> +void rtw_pci_release_rsvd_page(struct rtw_pci *rtwpci,
> +			       struct rtw_pci_tx_ring *ring);
> +
>  int rtw_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id);
>  void rtw_pci_remove(struct pci_dev *pdev);
>  void rtw_pci_shutdown(struct pci_dev *pdev);
> diff --git a/drivers/net/wireless/realtek/rtw88/pci_old.c b/drivers/net/wireless/realtek/rtw88/pci_old.c
> new file mode 100644
> index 000000000000..464b57d8a629
> --- /dev/null
> +++ b/drivers/net/wireless/realtek/rtw88/pci_old.c
> @@ -0,0 +1,522 @@

[...]

> +
> +static void rtw_pci_old_clkreq_set(struct rtw_dev *rtwdev, bool enable)
> +{
> +}
> +
> +static void rtw_pci_old_aspm_set(struct rtw_dev *rtwdev, bool enable)
> +{
> +	struct rtw_pci *rtwpci = (struct rtw_pci *)rtwdev->priv;
> +	struct pci_dev *pdev = rtwpci->pdev;
> +
> +	if (rtw_pci_disable_aspm)
> +		return;
> +
> +	if (enable) {
> +		pcie_capability_set_word(pdev, PCI_EXP_LNKCTL,
> +			PCI_EXP_LNKCTL_CCC | PCI_EXP_LNKCTL_ASPMC);
> +
> +		pcie_capability_set_word(pdev, PCI_EXP_LNKCTL,
> +					 PCI_EXP_LNKCTL_CLKREQ_EN);
> +	} else {
> +		pcie_capability_clear_word(pdev, PCI_EXP_LNKCTL,
> +					   PCI_EXP_LNKCTL_CLKREQ_EN);
> +
> +		pcie_capability_clear_and_set_word(pdev, PCI_EXP_LNKCTL,
> +			PCI_EXP_LNKCTL_CCC | PCI_EXP_LNKCTL_ASPMC,
> +			PCI_EXP_LNKCTL_CCC);
> +	}

Is this the right way? rtw88 (pci.c) never writes PCI_EXP_LNKCTL,
only reads it. Instead it uses DBI writes to RTK_PCIE_LINK_CFG to
enable or disable BIT_L1_SW_EN and BIT_CLKREQ_SW_EN.

rtlwifi writes PCI_EXP_LNKCTL as above, and additionally always
writes RTK_PCIE_LINK_CFG to enable BIT_L1_SW_EN and BIT_CLKREQ_SW_EN
in _rtl8821ae_enable_aspm_back_door().

rtlwifi writes PCI_EXP_LNKCTL only when the device is probed, whereas
rtw_pci_old_aspm_set() runs when LPS is enabled/disabled.

Does the comment in rtw_pci_link_cfg() apply to this older design?

	/* Though there is standard PCIE configuration space to set the
	 * link control register, but by Realtek's design, driver should
	 * check if host supports CLKREQ/ASPM to enable the HW module.
	 *
	 * These functions are implemented by two HW modules associated,
	 * one is responsible to access PCIE configuration space to
	 * follow the host settings, and another is in charge of doing
	 * CLKREQ/ASPM mechanisms, it is default disabled. Because sometimes
	 * the host does not support it, and due to some reasons or wrong
	 * settings (ex. CLKREQ# not Bi-Direction), it could lead to device
	 * loss if HW misbehaves on the link.
	 *
	 * Hence it's designed that driver should first check the PCIE
	 * configuration space is sync'ed and enabled, then driver can turn
	 * on the other module that is actually working on the mechanism.
	 */

(I'm looking at this again because BIT_CLKREQ_SW_EN is required
for Wowlan. The card can't wake the laptop unless this bit is set.)
