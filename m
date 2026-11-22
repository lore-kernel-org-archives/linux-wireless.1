Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795319612;
	b=g7aKFBq+HwDAEfEDhEpCUPai70/icUt8HqHuijYqlUWQ9L3CQHDOzDO4NsQQ26QWl9SP
	 NRacKZelzxquwqQBXnBbzcNwHt3XC7IWr80n6jor7PMNHbhzJViCtytmKRB019j1arkcd
	 5nc/St/j1OYugb0cayv7grWUBW+fJ2Ib+InEURZCgYQiDD4t34mqew4biHxX3hyXYGssg
	 1LYz+sOpYISQRhUFgHVpftfc7J/+eLEzo6zX1+ZNuYHn6IJEJJ8W6/LU6ZXPiVZCEoHih
	 KDibRoHYBgrhIWFgZH29XBbDXESsBOJWpyX2TJI0GxYkT2fq2phDHLh6U2K9fx4jHXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795319612;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	bh=NccmUxDuMRFpJH4cNND6aYCDkBafv7rBFddU0ZBGgdM=;
	b=ePWBlTLsSacv1r2grjoQXTBMtjtcMPJEj1qoBSpsbNnqs8PVQhOIwc+1SMmGtzhzrkEn
	 FYXFbCsULc78/NzvJtee4BAxKpLGOOh7sHgkrAsA/ZhgxTou3EY9le+0KCNJyIurvy5xy
	 UYD6wrR30dQg3vn2dGUAf9fjUOhA44l3L5vDcn5qMLT7HC/EXvrGnTFRqR4m2swSqjd84
	 zqwUck26trCyVxAOYyKnB3exm7ZXXqOqfN0xrRxey+82uiXgvlkWKhU4/sahGuixVScQa
	 IQv4yMzG5HzdTQW3OqcwQ4CXTZ0AFyYQGyKnf7F5AGPcxYXBWel+BRYku6PPz2ffwIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=cRTBCgU6;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43B9606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 03:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B43B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=cRTBCgU6
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AM3rS0p9547867, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795319609; bh=NccmUxDuMRFpJH4cNND6aYCDkBafv7rBFddU0ZBGgdM=;
	h=From:To:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=cRTBCgU6njcjq7Jic+DpYB5P1TZ2lXH9E26SUB0r1sxgSw7WcNNsuBLuIIzwvPPyz
	 rt14SHk3PsUTJ34eWowXI+AESD+1OsDDsk3Xyr+w2Xji5X0z7aECReH6bPfGxeN9U+
	 agzHwlTf24T2ygJTimwEIeTcGN6oI+HLTvBUSnGEgVUvpaeZdBs/237GrTpaYm+3WA
	 wbrd2xwkJe7bDWPoMwALhGgdlCPvMc6WXkIFd0Nk7UeyFLBLQsitDIqRyxfJqvKeYy
	 7j84W/m5SFpdfzDJRXy86y/daEhLr7uOch81HLTnOsBzM4JVHJBENMVedf0CuUU68T
	 a4i020QG0OtxQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AM3rS0p9547867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 11:53:28 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 11:53:29 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Sun, 22 Nov 2026 11:53:29 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ping-Ke Shih <pkshih@realtek.com>, <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH rtw-next] wifi: rtw88: debug: explicitly cast to u8 for %02x format in rtw_debugfs_get_tx_pwr_tbl()
In-Reply-To: <20261118025208.47465-1-pkshih@realtek.com>
References: <20261118025208.47465-1-pkshih@realtek.com>
Message-ID: <0ea74f75-d0d5-40ef-a606-09508d244209@RTKEXHMBS05.realtek.com.tw>
Date: Sun, 22 Nov 2026 11:53:29 +0800
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

> Explicitly cast to u8 to avoid smatch (with -p=kernel) warning:
> 
>    warn: argument 4 to %02x specifier has type 'schar'
> 
> Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

770ac3b1bfb1 wifi: rtw88: debug: explicitly cast to u8 for %02x format in rtw_debugfs_get_tx_pwr_tbl()

---
https://github.com/pkshih/rtw.git

