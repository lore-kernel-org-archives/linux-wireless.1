Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458393;
	b=C/JguIuupH5mL6Ffqr56WcusjhJh20ja3lJSl+HlBqd/sBM7jl5iVQ/+MovK7OV675Dt
	 uhyy+9JeSUV35y33nMkg+bd9xef/cC7JHgDbPmyJO631U8S8s97qt4a92D4lakLdnotJ8
	 qTDAkhhQAIcUkMgA+OwTh0DS1D3Dt78rW2BBylvfvuMlTwyWY1PQPCDOCir26Y1GAbpZF
	 qCvma6Ppv1KnPDSSW39OSvQNmqcq+CtgToNw7FVZzGd9unszc7GOl8x9xUvfY1Kdps8d/
	 Jqf0E6shuWYAuRIPQRr0oDcu1PTtjMUqYoMLekEYv76jYcTCguR94ImaXtnQSv3V08w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458393;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:Date:MIME-Version:Content-Type;
	bh=rIm43z3CtyqLAyh9pcHbAH2xyaZFFcoPENS7Uj+7x2s=;
	b=FiXKuCeGZ3XXuO3DIrS3Gs3xknb3FDzyiUZsrOcmXvvcqH7J9MPSBVAsC7tvEOQDYaTT
	 L/uu+jQnbXcGAenA3JeY0vWZsi3iPPSJziS7PTJyqMNmYt6spv9sYdY3l76MRsmmflX6/
	 HI59RoAdKlDdQFoMZ8f1N2pGI1dd+Sqoq5bxj4DevAQIJtLOb6LFPUcfJyeEZMD5v3N6q
	 GRiCUfXMpx19DOK8jt7oSfFd9xirUaExXWB6OGMcCrf8oCTUpWIGeKJwZMyata0WG+ORn
	 PPh5j7ZT6VWPbIBbMqaJGeLPf8fWCsufMYaR7GGnoLfY6Y8kgv+kHX9pY5Nn/vEA8Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=EDSa5Iyl;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8339F606A898
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 04:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8339F606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=EDSa5Iyl
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC4dhaE73415698, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794458384; bh=rIm43z3CtyqLAyh9pcHbAH2xyaZFFcoPENS7Uj+7x2s=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=EDSa5IylqOWHPx/SkMkMRq3UayzfyffpvJaBXkXkik+6JaTX6CF4rtuInpLzTtil+
	 xXetoMVUeZB8UltQ53/CXvVhfnmTuD4gsk7Zh+UB8UeJI8I/BPTB1QZmHsBxKd0w2W
	 RjbeILWPrWe6URqjf1lPLEc5Khlkt5An89qfVDMB/Fmm8jtO6wagPOOGAmcgtUryeD
	 xdhPzSa5+DfmkqAydw/ludODl4mry7gifglE4A0s9lrPNxOT2eu2Vre/COsIUCD6RF
	 M9CYv4bzCO3HdJLozPlhiNce4NS1SMRf2/s/CaYAImnIIo7GqlSqQr475PkXmvieuF
	 H4POuXGOWpq7Q==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC4dhaE73415698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 12:39:43 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 12:39:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 12:39:44 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 12:39:44 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ping-Ke Shih <pkshih@realtek.com>, <linux-wireless@vger.kernel.org>
CC: <timlee@realtek.com>
Subject: Re: [PATCH rtw-next 1/2] wifi: rtw89: enable low-latency power-save optimization for RTL8852B/RTL8852BT
In-Reply-To: <20261103075255.56487-2-pkshih@realtek.com>
References: <20261103075255.56487-1-pkshih@realtek.com> <20261103075255.56487-2-pkshih@realtek.com>
Message-ID: <9e4e9aa2-86a7-485f-90db-05edef7b0096@RTKEXHMBS06.realtek.com.tw>
Date: Thu, 12 Nov 2026 12:39:44 +0800
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

Ping-Ke Shih <pkshih@realtek.com> wrote:

> From: Chin-Yen Lee <timlee@realtek.com>
> 
> The low-latency power-save optimization (LPS) was originally
> introduced specifically for RTL8852A to improve interactive
> application performance by exiting power-save during packet
> bursts.
> 
> To extend this feature to RTL8852B and RTL8852BT, introduce
> a new flag "support_low_latency_lps" in chip info instead of
> hardcoding chip ID checks. Enable this capability for RTL8852A,
> RTL8852B, and RTL8852BT while explicitly disabling it for other
> supported chips.
> 
> Signed-off-by: Chin-Yen Lee <timlee@realtek.com>
> Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>

2 patch(es) applied to rtw-next branch of rtw.git, thanks.

e1744a3a4e21 wifi: rtw89: enable low-latency power-save optimization for RTL8852B/RTL8852BT
e25702b57659 wifi: rtw89: avoid premature power save entry for buffered traffic

---
https://github.com/pkshih/rtw.git

