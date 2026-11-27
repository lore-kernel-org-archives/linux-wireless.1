Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753534;
	b=GR/FAA4K1tuR3DVR73IZmbmCq3vIxhtZABkY2HaPJWn2CItwkuK0RTF56iP2PtdebUON
	 apePcUp9MXmcZ7fKz7Susqs3wTm97Y8OaRjXflXLfRx4BNU/J7+NRmUvgHYvEc2le7ouE
	 1WpTjrAwCY1UrRW8PBizh5zZZ4/mb2LIMw+AUGEmPDtLMYeaCjxBI05nFkV//zXaQgqcW
	 27QT+BtNI/VlHrv101iEegkkalSn0fESg2sF6zl2tsFudM9LWgsHfHVuwC9tSa6lIGuvJ
	 AjuhDZ3kc3sxVF0vd20RUl3PMqDebJv9lK2kW5zNstuirBjPbOh3QZpvkcJaLaA3LOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753534;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	bh=4d6ATEu2hv57oCjVrORMP9uM03XTOdvaTYDAQMhdMuM=;
	b=dDF6rIyGcZoqJDBiJ8rSnkUAQp5Fl90g2tF6kRWweAUkKMk+byWVIwkEqe9xN1hZTBaI
	 oZLNf8geUvVLnVMdUGxtZ9s9HQBVUCW8S1OSfBs95kG5rW9ZRiQP8xxdE+M0puPH2VCNR
	 kctDH206agnqrCtS+Q5arIoAvgZ42jEpjRsgQjtEnnREQsKmuyuL/2sblDtwbbIkfLuO1
	 Ghm/U5U2u9hSBSs1fEA3ou+ESWobnrsaizE651TvXUfc9GTjYQEVB5vtdIyvXlj9tTOFR
	 wSv7ekUHoOUvX9e6JkjsS9DZ67uqPl9Om0CbcihUs152Lo2ejypsNenVU8KenyZ/a0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=clYquv0N;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E853606A31C;
	Fri, 27 Nov 2026 04:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E853606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=clYquv0N
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR4P8Pj8632677, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795753508; bh=4d6ATEu2hv57oCjVrORMP9uM03XTOdvaTYDAQMhdMuM=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=clYquv0Np/eHolALbiGvCZokwjbQfyecCXG6Q1I44ZyC6WIm+7PlDmjWAwgjYYM7k
	 ySJfjuStW/tgp3TDqWXNmaNMWR3FfacpFS6PoTJPcTdRD81x83uqofa5syjKtT0hIZ
	 JuhJgZY7OhHDJEOkTGqgreHMljAZqHcEyUzVwtKTcRVKy54FMOhbDjVDI/cCthIP0g
	 odN7PcG1hao+8kQbXX8+MUF67TKLr9VRUj04dSm2s6qujR2Rl2VQcUZY4VSK90Gmiu
	 7qsrJ5ZZE32jlBNR/umta9Fc2DVFVyzWfME1Kyk/TrpFELW1i86GEbo3+teyceN7Na
	 X3b9oPJ+Ot6CA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR4P8Pj8632677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 12:25:08 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 12:25:07 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Fri, 27 Nov 2026 12:25:07 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>,
	<linux-wireless@vger.kernel.org>
CC: Ping-Ke Shih <pkshih@realtek.com>, Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH rtw-next v4] wifi: rtw88: 8822c: validate bw and nrx read from registers
In-Reply-To: <20261125203753.428868-1-zeshanahmednobin@gmail.com>
References: <20261125203753.428868-1-zeshanahmednobin@gmail.com>
Message-ID: <4db47594-0493-42ed-a727-d34fab8ef90e@RTKEXHMBS05.realtek.com.tw>
Date: Fri, 27 Nov 2026 12:25:07 +0800
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

Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com> wrote:

> rtw8822c_phy_cck_pd_set() reads nrx and bw from the chip with
> rtw_read32_mask() and uses them as indexes into dm_info->cck_pd_lv[][]
> and rtw8822c_cck_pd_reg[][].
> 
> When the chip stops responding on the PCIe bus, register reads return
> all ones, so bw and nrx both become 3. bw = 3 is past the end of both
> arrays.  When the chip stopped responding on Ubuntu's 7.0.0-43 kernel,
> UBSAN reported:
> 
>   UBSAN: array-index-out-of-bounds in .../rtw88/rtw8822c.c:4407:21
>   index 3 is out of range for type 'u8 [2][4]'
>   Workqueue: phy0 rtw_watch_dog_work [rtw88_core]
>   Call Trace:
>    rtw8822c_phy_cck_pd_set+0x33c/0x510 [rtw88_8822c]
>    rtw_phy_dynamic_mechanism+0x310/0x330 [rtw88_core]
>    rtw_watch_dog_work+0x217/0x330 [rtw88_core]
> 
> nrx = 3 fits in cck_pd_lv[][], but rtw8822c_cck_pd_reg[][] only has
> registers for nrx 0 and 1. The entry for nrx 3 is empty: register 0,
> mask 0. If bw is valid and the level changes, the driver uses that
> empty entry. rtw_read32_mask() then shifts by __ffs(0), which is
> undefined; in a test that faked only nrx 3, UBSAN reported "shift
> exponent 64 is too large".
> 
> Return early if bw or nrx is out of range, before either is used as
> an index.
> 
> Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
> Reported-by: Luka Gejak <luka.gejak@linux.dev>
> Closes: https://lore.kernel.org/linux-wireless/f6a7d3272fe7635c6a83698dfab5d85500437ca6@linux.dev/
> Cc: stable@vger.kernel.org
> Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

ae6b9e98b904 wifi: rtw88: 8822c: validate bw and nrx read from registers

---
https://github.com/pkshih/rtw.git

