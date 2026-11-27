Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795751245;
	b=li4Vu3MeFAyulyKVZWwWO+vkoskQ5nS6uhOc9mUGm1yvsPg7P1iX99arGV0v9hKMd5zl
	 qFt7bu/RZuUkZTkoVMKTG44gJnlMBU2hJBQpQqjNVmyK80bFNuGlhgEekyM5up/cBFNUt
	 1w5sSjmOQx88CowpM5h93XHzCrs0UfhJAIomVi6g0CJolZs3bFuUiArJRdNIsSULb+lOz
	 1ZQ6rttMXTvvZkXwTjomLKQxZQ2Hund9WuH/zvDI5bnC6e3+HD1vnl4WF97xEPjOJO5GE
	 PUNbqKst9ZCWNupnMXc90G7OPp6vrLodEw+znZ0gDW1tIU/satJN+Sw4adYtIfcGV9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795751245;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	bh=UfyWt3MqHbJH/xutHTcb5+FJwsBOIOzwTpj3xziBDCY=;
	b=EilM5uEh7U2ZUXIItjitucNsCK1FkPaFIcf19FUz8JY0eXLSpeBE9vzEgqCKHd1AoZh1
	 nOdlbwZJy6hS7svcSBtjCddG3g61XaqTWCCtiarbpFy5gajileDoVLs8f1TD+OrOgOmjK
	 iyJS0osuc5zC1QwVzfYYRbKbjNPUR6FWKkDCeIDLBQAnr59cZjvIwNLqHFWU+0FsE/RGt
	 d1G91fd2T4DTZrJpa524EdsrjQWB8EoOcDQASE9xKoaew82jip+bHIIc8WiRRyhwPBGol
	 vs8gCZ+ZG6rTnyrJrSroRLfKHbWymZNLONmQRBsKjo6PcHg70x00zsXdTzyO6gFy5pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SGSgRtkN;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3161606A321
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 03:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3161606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SGSgRtkN
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR3lKNp9600805, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795751240; bh=UfyWt3MqHbJH/xutHTcb5+FJwsBOIOzwTpj3xziBDCY=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=SGSgRtkN17gUQJCjKPT9n7OF8WUxoKfB6EGvQyXK2XXfPQ/iI+2XALU7C+Kchqk9h
	 dNcs67Swpjpfo09GcQvhcLy9rZW/s6Dx+yfBuRxKJLFYifccUqqxf/z6D/BoaBGmoq
	 dMOgf+y8exQQGAiUNKInL25X00/sHXD09BemJMllD6jSzfyqM2mALp6Nm4YmywYIlG
	 PNc5jtJXBY9En3PAOc/UQIxL4fgCGb8WciIykuLz1fWmdhvJCR66MGgJcw7k8SxDrz
	 rzHr3d2OC8SlxyTns6eEBeMX3+JUibl3H37UdAEEFcyJL4Dps1TAzQfZ6UHYWdj2V4
	 J3wnxUxPiUNWA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR3lKNp9600805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 11:47:20 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 11:47:20 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Fri, 27 Nov 2026 11:47:20 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Josef Schlehofer <pepe.schlehofer@gmail.com>, Ping-Ke Shih
	<pkshih@realtek.com>
CC: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH rtw-next v2] wifi: rtw89: debug: fix diag_mac crash
In-Reply-To: <20261123103647.50876-1-pepe.schlehofer@gmail.com>
References: <20261123103647.50876-1-pepe.schlehofer@gmail.com>
Message-ID: <a4078a70-c6fd-4c64-9396-0685c60a2de5@RTKEXHMBS06.realtek.com.tw>
Date: Fri, 27 Nov 2026 11:47:20 +0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Josef Schlehofer <pepe.schlehofer@gmail.com> wrote:

> Some DIAG_MAC elements start with rules for other HCI types.
> rtw89_mac_diag_iter_all() skips those rules but still updates
> prev_sheet and prev_seq. The first rule matching the device can
> therefore be mistaken for a continuation of the same sequence,
> leaving p_rewind uninitialized. A later sequence transition then
> rewinds the output pointer to an invalid address and can crash the
> kernel.
> 
> Update prev_sheet and prev_seq only for rules that are processed.
> 
> A walk over the DIAG_MAC rules in linux-firmware 20261019 showed
> unchanged sequence grouping on PCIe and corrected grouping on USB/SDIO.
> 
> Tested on RTL8922AU (Cudy BE6500) over USB in AP mode with
> backports 7.2 on Linux 6.18.64 (OpenWrt). Without the fix, the first
> read crashed the kernel. With it, three reads returned 147(41)/86/84
> and traffic kept working.
> 
> Fixes: 7bf433c6767f ("wifi: rtw89: debug: add parser to diagnose along DIAG_MAC fw element")
> Cc: stable@vger.kernel.org
> Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

c180ef3bfe54 wifi: rtw89: debug: fix diag_mac crash

---
https://github.com/pkshih/rtw.git

