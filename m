Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795545737;
	b=ZI11BvMJGm0VJfazKirq0WGHOTJ/FLEV5C/97OxeEcc15zMVIfsO2a1/eiu0qg3o8Gne
	 IbGNptvPv6+7gRheS7atAdP29kPn50Cs4i69qjqFNYtp/x3eG0ios6uLJhii21IfCF8Jy
	 SWFh8Pc77geeMoH1+4DlQllbz1WjnNmaeeAxnRtkvCyHyseVWldjPVLlZW/4IEA91b5yh
	 0RWyGuy7ixBF87ZRsbvmfgLERm6d5vRckawvvGyx+BRbWMhmZi5qTQnEDmb14yERPKfBW
	 377uGrJb2Brh3KcVClTT1f55W0qlNA5GrDyMoJb/1J2LpNtJrxb9H06x0CQX/7x2PpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=JMINIYsCn6yUeW7yJNonyXuPok5cLNp45Rd+b+bTO7I=;
	b=dFL0e/rzC6Om0p/VUHCiWtKq9Nynw70hwoKEJ0aCV+z4b89K8Kzs+jRsAVMoQJAo1Tvc
	 F95ijCHUxC2RXvEXVyy1HF4mkya7++Uj4SYNMh1Hlfvs5AOnP4aploEH39tF+d0wkcGQv
	 2AKgxEnJaqUSNV7R/kc3ERXEsMvh14fvqsrScH+FiHsHSw+DOg21cbumOscWyBB9mJHsW
	 tFPFtcdfAc0PCAclnWJm38lTE/TJbBYEiUM1s0j++76QNPOw6XAkP98cLp3dwB4xoXCVh
	 unOvH3tYeHJIMRJqY9Ai6BxZCckJQQkP4A49cZ1Xgq4RiqF8rDER1O6y7vra3Itg9sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qwv/gWnJ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EEF606A323
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 18:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0EEF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwv/gWnJ
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386c71feeeaso1012002eec.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 10:42:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795545736; cv=none;
        d=google.com; s=arc-20260327;
        b=UHc+Bznx4n1jRPWLst5pSbP3vY5CsXOuIYCf20UYLL+rJ3KjUdwuBJeddZFXXLGLh5
         7hNzzaoXFK1hIWZfFVT7Bp9mxNaD2doNy0ucXzjIeabZfYt4ul/qR7g1yrEMgLWw0rY6
         A0H840Yk11wqsMdxdr+HXOMBtrqgFsdmAx2dYfMo/l4SgI8tpWcJilHmbUYvZpYXos88
         rXl4mU65oovLEJYB56Cfn2zJ/twM5lPXbpUpSNIf9bs6K9DhpiNEKIGqtKJzyGpafWYl
         q89ycuGriabKsW/NTDJgsD3HDlrCB8Wrm9CK9K50rVnyr582FxC7afwBWSE984PvoBoW
         zVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JMINIYsCn6yUeW7yJNonyXuPok5cLNp45Rd+b+bTO7I=;
        fh=zD6H9VgzeycD3ToMoSTD93IHEai9IJiH2+2m8WHTJjs=;
        b=GMpF1w+zPasx/ULpDWrzeQnRPnK8giN0wuVINkLlFf3l4o8ujvZZAyxXvoQVWL2MiW
         4VtaHJR5DVwuIIU7G8hcOhrsYjdL6GkrDz+LBh9pC+O1apW5TksfLf9hOP2dMEqV1owR
         2zNQS76zH5QokeZbtBrUdmwJ+qWASDXdPLoQsOMis7EERqQ/fvrC98Rh0wkV+wBVRlJE
         v/tb8vy+mk3hM5J1MTCCNlVPedUPmzaTtG0fm3NxgHEggrRrGQAnA2U7AlUWzS0Vgvzv
         vnO2Vdzq0aULnezXcmeQ6lpglXk7LQBKKlQyKKh9TWCBswYgbIBwcKG933wkf6p8jLh8
         GGVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795545736; x=1796150536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JMINIYsCn6yUeW7yJNonyXuPok5cLNp45Rd+b+bTO7I=;
        b=qwv/gWnJd3ofiLL5JzENDfhONj+1O1uiEtOfOavaqKcbEZUE30RZmSHfGDPhudH84Q
         RcNR4n4AS2mKGnPuiEXkvbH+h5xGMe1Vj69h3aHckDwXZb2ABDrffIOAdR8elgCYiy5p
         noju83PmhYnb1k4qHe0NgKiV5rS+N3auli8V/xk5Y21z2T+DjTttuPdkis5hnGoSGPqx
         Ga5jq8ZAIKc1PDXkSCoVHkYBSoC/TCBCVmkKncCv0+Axw6NJLrEuRq+AhdGDa1xQmoUu
         AzxhRU1zp3F2UeiXUB2tZHC5zw+XBFxSKb4l2cm6ZeszGjGo6H+gYBxRjDn+tU0HSsz9
         Q/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795545736; x=1796150536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMINIYsCn6yUeW7yJNonyXuPok5cLNp45Rd+b+bTO7I=;
        b=E/Re+fy6FHjQeZTDno7Mv55afum38OgzwDEhhGGSWmjiQNMN9I1T4Ls2QR6OG+PjUu
         aGg2m5AZkaXnJOPK2jSsSbY/RenkF6M3EeVMY3YYnwKsq067oCt+/Mxwq0uJYyBBBOLE
         f1SB6cNaepMqLzfaJp15Nyem2z2k/LRgX1iCKuwTxkIWBh/hDTJe9svMhdI6lrkKS0JN
         102hqhRU7Vk+Zldxkc8mnBW+hnxq3kbE/dj5Vbz5PAf0nuF032/oDo7y+ifANj9Bxmud
         K3wIb7dbxXEMd/zJ8j2eBxynTdDLZOUqYrZwvAtJjxL1wZ57n39FphkpJa4lbpSQBZhu
         SxMw==
X-Gm-Message-State: APuU4Z8H9O0HAvDMcyE0PguAAoSuq8jVLjaWr9SfaLC4nWOXFmsiVqK5
	bx3vhsFHn5E3LGALEm8G750Q0yPhwDPItIFhpvgESH/mwGyaszyEI5CU45twoPmua1QpWU1J6k0
	jMryZRBqYqMUuHjG1VVGRKQhaH5TGNA5fRDqohyEIqQ==
X-Gm-Gg: AZFdTZf2NiRyKzvvDoAqc9DphTdWEbS0KU0vdviE5vnW2y2vvcAcvLBd8XfTAgGlBTh
	kPFaSblMuUMbFwVhfREQbvclwVr1+ocwdSjAPssPgi2+4k4oFYFJaM9/ot/KFYZqTgOi0WxzdDT
	dtkwD/pzvfRIaLJQTGFwHv7sPprdYLQK5VG2GHsA79dAzVdy/e56VPD4gDvrspTLtXp+CzyQmQC
	F6m42HDAACue24XFtRM0P9Mm9pdqOR3Ls8RYHW/5K4DpsIjtKat1Fd91Kv2pL/wCkLmjViwMMZ6
	UQMuvuRi383nzR4lnj7VL3OHj+wn248NgEq+EBx8BB/tfHNC0nJdouXVAi4Tcw1Qm7dZG3zh3m5
	xNXuSQBwR2yjACF/OQwrW5Yg5YFet3u8542hbZgRCFOUNOX0z0UViTnNlkA==
X-Received: by 2002:a05:7301:1703:b0:386:319b:fb0f with SMTP id
 5a478bee46e88-386319bfc98mr14605704eec.38.1795545735667; Tue, 24 Nov 2026
 10:42:15 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124183257.405801-2-johannes@sipsolutions.net>
In-Reply-To: <20261124183257.405801-2-johannes@sipsolutions.net>
From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 24 Nov 2026 21:42:03 +0300
X-Gm-Features: Aa3M54o2aRUH46AdrOMqPsv035qvXiqRAnT3dslfp_mHyQSSiuGrBf8ID1zmTGA
Message-ID: <CAFGfvX6m6Q3GpfMTbp4BKJasenhCvgOvmkR0eFQ-+xS3U=6NdQ@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: qtnfmac: remove the driver
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, Stefan Lippers-Hollmann <s.l-h@gmx.de>, 
	Johannes Berg <johannes.berg@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

RIP qtnfmac. With madwifi on the inside and cfg80211 on the outside,
it was a lot of fun hacking on it.

Reviewed-by: Sergey Matyukevich <geomatsi@gmail.com>

Regards,
Sergey

=D0=B2=D1=82, 24 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 21:3=
3, Johannes Berg <johannes@sipsolutions.net>:
>
> From: Johannes Berg <johannes.berg@intel.com>
>
> Quantenna was acquired and shut down, and the IP has
> (to anyone's knowledge) never been reused. Now their
> domain has also lapsed and is spam/ads.
>
> Sergey reminded me that we already discussed this a
> few years ago, and Stefan Lippers-Hollmann then had
> pointed out that despite code support for devices in
> the wild, firmware was never available [1].
>
> [1] https://lore.kernel.org/linux-wireless/20240228040255.0932ba6c@mir/
>
> Remove the driver alltogether, it has only gotten
> static checker fixes and a handful of API updates
> since early 2020.
>
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> ---
>  MAINTAINERS                                   |    7 -
>  drivers/net/wireless/Kconfig                  |    1 -
>  drivers/net/wireless/Makefile                 |    1 -
>  drivers/net/wireless/quantenna/Kconfig        |   17 -
>  drivers/net/wireless/quantenna/Makefile       |    7 -
>  .../net/wireless/quantenna/qtnfmac/Kconfig    |   21 -
>  .../net/wireless/quantenna/qtnfmac/Makefile   |   30 -
>  drivers/net/wireless/quantenna/qtnfmac/bus.h  |  158 -
>  .../net/wireless/quantenna/qtnfmac/cfg80211.c | 1298 --------
>  .../net/wireless/quantenna/qtnfmac/cfg80211.h |   18 -
>  .../net/wireless/quantenna/qtnfmac/commands.c | 2765 -----------------
>  .../net/wireless/quantenna/qtnfmac/commands.h |   82 -
>  drivers/net/wireless/quantenna/qtnfmac/core.c |  933 ------
>  drivers/net/wireless/quantenna/qtnfmac/core.h |  159 -
>  .../net/wireless/quantenna/qtnfmac/debug.c    |   23 -
>  .../net/wireless/quantenna/qtnfmac/debug.h    |   37 -
>  .../net/wireless/quantenna/qtnfmac/event.c    |  797 -----
>  .../net/wireless/quantenna/qtnfmac/event.h    |   14 -
>  .../wireless/quantenna/qtnfmac/pcie/pcie.c    |  493 ---
>  .../quantenna/qtnfmac/pcie/pcie_priv.h        |   90 -
>  .../quantenna/qtnfmac/pcie/pearl_pcie.c       | 1199 -------
>  .../quantenna/qtnfmac/pcie/pearl_pcie_ipc.h   |   82 -
>  .../quantenna/qtnfmac/pcie/pearl_pcie_regs.h  |  121 -
>  .../quantenna/qtnfmac/pcie/topaz_pcie.c       | 1234 --------
>  .../quantenna/qtnfmac/pcie/topaz_pcie_ipc.h   |   94 -
>  .../quantenna/qtnfmac/pcie/topaz_pcie_regs.h  |   45 -
>  .../net/wireless/quantenna/qtnfmac/qlink.h    | 1891 -----------
>  .../wireless/quantenna/qtnfmac/qlink_util.c   |  303 --
>  .../wireless/quantenna/qtnfmac/qlink_util.h   |   73 -
>  .../wireless/quantenna/qtnfmac/qtn_hw_ids.h   |   35 -
>  .../net/wireless/quantenna/qtnfmac/shm_ipc.c  |  162 -
>  .../net/wireless/quantenna/qtnfmac/shm_ipc.h  |   65 -
>  .../wireless/quantenna/qtnfmac/shm_ipc_defs.h |   33 -
>  .../wireless/quantenna/qtnfmac/switchdev.h    |   24 -
>  .../net/wireless/quantenna/qtnfmac/trans.c    |  213 --
>  .../net/wireless/quantenna/qtnfmac/trans.h    |   44 -
>  drivers/net/wireless/quantenna/qtnfmac/util.c |  123 -
>  drivers/net/wireless/quantenna/qtnfmac/util.h |   34 -
>  38 files changed, 12726 deletions(-)
>  delete mode 100644 drivers/net/wireless/quantenna/Kconfig
>  delete mode 100644 drivers/net/wireless/quantenna/Makefile
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/Kconfig
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/Makefile
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/bus.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/cfg80211.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/commands.c
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/commands.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/core.c
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/core.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/debug.c
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/debug.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/event.c
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/event.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/pcie_priv=
.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pci=
e.c
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pci=
e_ipc.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pci=
e_regs.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pci=
e.c
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pci=
e_ipc.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pci=
e_regs.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/qlink.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/qlink_util.c
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/qlink_util.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/qtn_hw_ids.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/shm_ipc.c
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/shm_ipc.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/shm_ipc_defs.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/switchdev.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/trans.c
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/trans.h
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/util.c
>  delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/util.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index deb7878202a4..4d56a30eb0e7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23345,13 +23345,6 @@ S:     Supported
>  W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/wcn36=
xx.html
>  F:     drivers/net/wireless/ath/wcn36xx/
>
> -QUANTENNA QTNFMAC WIRELESS DRIVER
> -M:     Igor Mitsyanko <imitsyanko@quantenna.com>
> -R:     Sergey Matyukevich <geomatsi@gmail.com>
> -L:     linux-wireless@vger.kernel.org
> -S:     Maintained
> -F:     drivers/net/wireless/quantenna/
> -
>  RADEON and AMDGPU DRM DRIVERS
>  M:     Alex Deucher <alexander.deucher@amd.com>
>  M:     Christian K=C3=B6nig <christian.koenig@amd.com>
> diff --git a/drivers/net/wireless/Kconfig b/drivers/net/wireless/Kconfig
> index f4f969fdbc02..978976ce8e85 100644
> --- a/drivers/net/wireless/Kconfig
> +++ b/drivers/net/wireless/Kconfig
> @@ -37,7 +37,6 @@ source "drivers/net/wireless/silabs/Kconfig"
>  source "drivers/net/wireless/st/Kconfig"
>  source "drivers/net/wireless/ti/Kconfig"
>  source "drivers/net/wireless/zydas/Kconfig"
> -source "drivers/net/wireless/quantenna/Kconfig"
>
>  source "drivers/net/wireless/virtual/Kconfig"
>
> diff --git a/drivers/net/wireless/Makefile b/drivers/net/wireless/Makefil=
e
> index fa3100ff3bf7..26f471a92719 100644
> --- a/drivers/net/wireless/Makefile
> +++ b/drivers/net/wireless/Makefile
> @@ -15,7 +15,6 @@ obj-$(CONFIG_WLAN_VENDOR_MICROCHIP) +=3D microchip/
>  obj-$(CONFIG_WLAN_VENDOR_MORSEMICRO) +=3D morsemicro/
>  obj-$(CONFIG_WLAN_VENDOR_NXP) +=3D nxp/
>  obj-$(CONFIG_WLAN_VENDOR_PURELIFI) +=3D purelifi/
> -obj-$(CONFIG_WLAN_VENDOR_QUANTENNA) +=3D quantenna/
>  obj-$(CONFIG_WLAN_VENDOR_RALINK) +=3D ralink/
>  obj-$(CONFIG_WLAN_VENDOR_REALTEK) +=3D realtek/
>  obj-$(CONFIG_WLAN_VENDOR_RSI) +=3D rsi/
> diff --git a/drivers/net/wireless/quantenna/Kconfig b/drivers/net/wireles=
s/quantenna/Kconfig
> deleted file mode 100644
> index 91d78c68561f..000000000000
> diff --git a/drivers/net/wireless/quantenna/Makefile b/drivers/net/wirele=
ss/quantenna/Makefile
> deleted file mode 100644
> index cea83d178d2e..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/Kconfig b/drivers/net=
/wireless/quantenna/qtnfmac/Kconfig
> deleted file mode 100644
> index b4a6df06da54..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/Makefile b/drivers/ne=
t/wireless/quantenna/qtnfmac/Makefile
> deleted file mode 100644
> index 40dffbd2ea47..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/bus.h b/drivers/net/w=
ireless/quantenna/qtnfmac/bus.h
> deleted file mode 100644
> index 7f8646e77ee0..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c b/drivers/=
net/wireless/quantenna/qtnfmac/cfg80211.c
> deleted file mode 100644
> index 139f67adead7..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.h b/drivers/=
net/wireless/quantenna/qtnfmac/cfg80211.h
> deleted file mode 100644
> index c374857283ac..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/commands.c b/drivers/=
net/wireless/quantenna/qtnfmac/commands.c
> deleted file mode 100644
> index 77929ed9ef78..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/commands.h b/drivers/=
net/wireless/quantenna/qtnfmac/commands.h
> deleted file mode 100644
> index 72ad6ae5c750..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/core.c b/drivers/net/=
wireless/quantenna/qtnfmac/core.c
> deleted file mode 100644
> index 0b5b60815c7f..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/core.h b/drivers/net/=
wireless/quantenna/qtnfmac/core.h
> deleted file mode 100644
> index a377d85c2451..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/debug.c b/drivers/net=
/wireless/quantenna/qtnfmac/debug.c
> deleted file mode 100644
> index 2d3574c1f10e..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/debug.h b/drivers/net=
/wireless/quantenna/qtnfmac/debug.h
> deleted file mode 100644
> index 61b45536b83a..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/event.c b/drivers/net=
/wireless/quantenna/qtnfmac/event.c
> deleted file mode 100644
> index fb5a56b6dd05..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/event.h b/drivers/net=
/wireless/quantenna/qtnfmac/event.h
> deleted file mode 100644
> index 533ad99d045d..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c b/drivers=
/net/wireless/quantenna/qtnfmac/pcie/pcie.c
> deleted file mode 100644
> index 3adcfac2886f..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie_priv.h b/dr=
ivers/net/wireless/quantenna/qtnfmac/pcie/pcie_priv.h
> deleted file mode 100644
> index 2a6a928e13bd..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c b/d=
rivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c
> deleted file mode 100644
> index c1a53e1ba3be..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie_ipc.h=
 b/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie_ipc.h
> deleted file mode 100644
> index 634480fe6a64..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie_regs.=
h b/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie_regs.h
> deleted file mode 100644
> index 6e9a5c61d46f..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c b/d=
rivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c
> deleted file mode 100644
> index 2e00bf68d001..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie_ipc.h=
 b/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie_ipc.h
> deleted file mode 100644
> index eb30e9d08de2..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie_regs.=
h b/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie_regs.h
> deleted file mode 100644
> index 4782e1ed3c2c..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/qlink.h b/drivers/net=
/wireless/quantenna/qtnfmac/qlink.h
> deleted file mode 100644
> index eae35b678952..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/qlink_util.c b/driver=
s/net/wireless/quantenna/qtnfmac/qlink_util.c
> deleted file mode 100644
> index 30b60d6ae546..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/qlink_util.h b/driver=
s/net/wireless/quantenna/qtnfmac/qlink_util.h
> deleted file mode 100644
> index 230a10a41c7a..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/qtn_hw_ids.h b/driver=
s/net/wireless/quantenna/qtnfmac/qtn_hw_ids.h
> deleted file mode 100644
> index 82d879950b62..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/shm_ipc.c b/drivers/n=
et/wireless/quantenna/qtnfmac/shm_ipc.c
> deleted file mode 100644
> index ff678951d3b2..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/shm_ipc.h b/drivers/n=
et/wireless/quantenna/qtnfmac/shm_ipc.h
> deleted file mode 100644
> index 52cac5439b03..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/shm_ipc_defs.h b/driv=
ers/net/wireless/quantenna/qtnfmac/shm_ipc_defs.h
> deleted file mode 100644
> index 78be70df1218..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/switchdev.h b/drivers=
/net/wireless/quantenna/qtnfmac/switchdev.h
> deleted file mode 100644
> index b962e670c4b0..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/trans.c b/drivers/net=
/wireless/quantenna/qtnfmac/trans.c
> deleted file mode 100644
> index 95356e280e23..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/trans.h b/drivers/net=
/wireless/quantenna/qtnfmac/trans.h
> deleted file mode 100644
> index c0b76f871b31..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/util.c b/drivers/net/=
wireless/quantenna/qtnfmac/util.c
> deleted file mode 100644
> index 4ad66cc1804d..000000000000
> diff --git a/drivers/net/wireless/quantenna/qtnfmac/util.h b/drivers/net/=
wireless/quantenna/qtnfmac/util.h
> deleted file mode 100644
> index a14b7078a9c7..000000000000
> --
> 2.56.1
>
