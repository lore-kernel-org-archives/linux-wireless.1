Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460495;
	b=32pjfg7RG9M82djssaQ5aVkTst3itEpZ63Hm4nRHRCbbxJ0GoVpugzyTNrS1kHX7/cM1
	 K9KvJ2iwd/ttpgKxWPpAJ8vT8WLm04wEHvrNrPySE5Dcy4qEbnzMhn4wHWNWDlGo1pptX
	 mtWqqxV8wicMP+ISvNOGzP8sAyzJj4kbDUMVf9GgGknW22BsM+zTVcnggi+3pZ6CBDNKO
	 zb+RXtvKXVwC+fXnclPfqx2JZ7urKyEHzkqQbDwwQ5W2kv2St74XdWtvE8PFvfwxoWEvM
	 ksvgDgBHmkY4zvIp71RMOeB+OzPIYz2GnBYM0pXEQ2DAq/y7PgNiPrv3MYeu8yt+fpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460495;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	bh=OUphkcWosK3N7M+P8ztQ3uFcu8PLRjIlRJvcLIrsQj0=;
	b=3GLpu8DMWQL0GrEJyJU6YMBTfHb57QrQVWX+AE1e2c+Aguzql1DrVysxVJnWmzUySmFn
	 rHcwlzLIrAzxAyJ3KxEOhqHXeKAM0iqx7IMO7F3mj26kiTMKMM/2D/ezpuTtNSGZc0K2e
	 XcRwRtUIVzaOwbcde4yECBppZx2pCWTTqbu35tiKteF9AkKHpJK2w86LaxHn7unTht2JY
	 1t6aQVJ2Xw0j/rMBI+nEGsQ5zKAU4gCN/fJzSYS15TnbYsNyjZW7ty5VLcWyrJlCRfkaV
	 7AM/FagmoKSAgfxGYcEPTZgEZf9jlQGxCDApSOTVM+VzYkXfICq4p8n+I/ShGBWN/Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="FzvzGzz/";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC09606A334
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AC09606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=FzvzGzz/
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC5Ei0pA3436426, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794460484; bh=OUphkcWosK3N7M+P8ztQ3uFcu8PLRjIlRJvcLIrsQj0=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=FzvzGzz/XoRh73seecND3J1BIiwkbVVtY1KVs7rAfaxrTke1aY3Nio1ZxAb+Ctxe7
	 J9mtJt6isQTLKEzLx/tfiF30ak1NmG5SOS4zSG+Xix0DIan37gUb6CLcv812Cy3yI3
	 ESSMld38qsZ339X0+BMJ+gbwNODkCbjrzOPfJbg3ToRzvmXOnRUWkDpyRHnwJzGjMJ
	 qEhG/VQYDU/0twelddcqHQfNzs+AFvsjwv42pV8Btei+01aKh8RELsaMkG9VMaWzVz
	 y9gPC8clh19hE7/z1ki80UUFEuUgXBOjN4mL6PQ3gS/lYwJup85QHoY3YFogHZTwWA
	 8J6Wowmc7micQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC5Ei0pA3436426
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 13:14:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:14:44 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:14:44 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ping-Ke Shih <pkshih@realtek.com>, <linux-wireless@vger.kernel.org>
CC: <charlesl@valvesoftware.com>, <sabae@valvesoftware.com>,
	<kevin_yang@realtek.com>, <wenjie.tsai@realtek.com>
Subject: Re: [PATCH rtw-next v4 1/2] wifi: rtw89: add firmware-assisted regulatory domain learning
In-Reply-To: <20261104093008.63916-2-pkshih@realtek.com>
References: <20261104093008.63916-1-pkshih@realtek.com> <20261104093008.63916-2-pkshih@realtek.com>
Message-ID: <112b2db2-f173-48bb-9f6a-28d6075c5ea9@RTKEXHMBS06.realtek.com.tw>
Date: Thu, 12 Nov 2026 13:14:44 +0800
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

> From: Johnson Tsai <wenjie.tsai@realtek.com>
> 
> Introduce a FW feature for regulatory domain learning, and add flow to
> maintain the lifecycle of the FW process. With the FW feature supported,
> FW can attempt to detect the most likely regulatory domain according to
> surrounding APs. This FW feature will only be activated when there is no
> active chanctx, and its regdom result can be replaced by another request
> with higher priority.
> 
> Now, the priority order of various regdom requests is as follows.
> 1. programmed in module
> 2. set by distro/user
> 3. set by country IE
> 4. FW regd learn
> 
> Besides, the FW process of this FW feature will be canceled immediately
> once a distro/user regdom request or any non-WW regdom request arrives.
> Then, this FW feature will no longer run until a WW regdom request comes
> even if it's in the range where it can be activated.
> 
> One difference from before is that once a regdom result is obtained from
> this FW feature, there will be a wiphy regd, e.g. `iw reg get` will show
> regdom by phy instead of only global regdom. But, the wiphy regd will be
> updated as appropriate as possible.
> 
> Cc: Elliot Saba <sabae@valvesoftware.com>
> Cc: Charles Lohr <charlesl@valvesoftware.com>
> Signed-off-by: Johnson Tsai <wenjie.tsai@realtek.com>
> Co-developed-by: Zong-Zhe Yang <kevin_yang@realtek.com>
> Signed-off-by: Zong-Zhe Yang <kevin_yang@realtek.com>
> Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>

2 patch(es) applied to rtw-next branch of rtw.git, thanks.

27c7643765e4 wifi: rtw89: add firmware-assisted regulatory domain learning
61a5eb87b2d9 wifi: rtw89: debug: support to disable regd learn

---
https://github.com/pkshih/rtw.git

