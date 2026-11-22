Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795319455;
	b=bZUBqHwfNJ7T4+wbsLUCueV44PMRFm+9qM8834VAy6xBRiHhOFL5St4VLYyOWeEfyLEo
	 VOvr9kb5KQPqheyggwBZ286u4/4cBsInnwuCg8qbGLuys2KQDUADeYVvIQ3KzDLFp+pCp
	 Yo7sLHPW/CtoW8H3uemZg0S0PWVlpgKO5Te2B8Z7tNVISGEZ3xbBkcVbPCDo4UgiA3KwL
	 5KpZVH8TDd9D+R8WuPy/5YK8qcpguRQrBBroBEEg1INzBDdIXKlJhuBuIFviQNf/SHTLs
	 tTNpstM+Q5w3jCIZkFiXRsO8Rpj7yz2ihurdlRnuMpAwq9j8efVD0ysVemW7IQbuUAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795319455;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	bh=duT0CN/OPyqxslhhbmTPViyKVwjKZg2oCFUDIPAW4BI=;
	b=RUWbZLXsdStowoq6nH5RLaHc7AeF/9ACT9rug+tIVhDLX99Pty0CUHA0//bPUlVRu02U
	 Dbvfy6/n6nxxr9wUJulpIKmndPIaaObXusu3/9hiEwM0k3xTdeAXUraHhp5Ki00S0hC3s
	 SDN+qpseRrrJIUu7k8UFjgEZ28oqp8muf33FVMzZnYq0I9pgHezSoXhDkqTMmd+Rp5wfR
	 MvMIjnHqFFD0PqoIzvtxm7H02HewdRL+6O1v2Klmgq1skHx5zmtEvd1KzxB6mAL3zWrdt
	 C8WhnQjfaF1gu44xBblv3hnkYqzuHwAiUNeUgiY9JHl/Dw4qU2Goqgm+DgMmd9vgnZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ExOAkmsJ;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367D4606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 03:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 367D4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ExOAkmsJ
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AM3oq4N3547232, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795319452; bh=duT0CN/OPyqxslhhbmTPViyKVwjKZg2oCFUDIPAW4BI=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=ExOAkmsJNs0RnrtqlWlSvfEiwQx0ugLxLxulRUg3BXhTeH/8T12bqnowZl5JgKTww
	 K3wRxeMkBMaS6ijP1iGngiyCQENWNg2XhNZyIMv1J6/u88cUn7avwz2WjOWODZeLSL
	 89wOLoPoQqx3bPFLvpAUFEf5oMD50vPKWwOruaQOB2CQjTFP6gSnRgCyS0by9tU6vL
	 PqOpo+0eJUBMtKHQ6roWjh5VISBIcUj9oS1Kk27ckjP4FSah+P16K1quqQlwtOSNw0
	 veu2ntLQFXjGJv/Kz7fXzG2I/Werp5RUmo3K4DmMglfWwsb2QqxTORDa6crbGdhuzp
	 NQqfEKzyeIoyg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AM3oq4N3547232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 11:50:52 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 11:50:52 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Sun, 22 Nov 2026 11:50:52 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ping-Ke Shih <pkshih@realtek.com>, <linux-wireless@vger.kernel.org>
CC: <echuang@realtek.com>, <henchy.chen@realtek.com>
Subject: Re: [PATCH rtw-next] wifi: rtw89: 8922d: add DTP for thermal protection
In-Reply-To: <20261117084447.65229-1-pkshih@realtek.com>
References: <20261117084447.65229-1-pkshih@realtek.com>
Message-ID: <04dc844d-3554-45d0-9912-95c6ee40cb0a@RTKEXHMBS05.realtek.com.tw>
Date: Sun, 22 Nov 2026 11:50:52 +0800
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

> From: Hsiao-Yung Chen <henchy.chen@realtek.com>
> 
> Add dynamic TX power (DTP), which limits TX power of each station through
> the power limit by MAC ID, to prevent temperature from getting too high
> during high throughput.
> 
> DTP is enabled when thermal value is over a threshold, which is defined
> as the thermal value corresponding to 110 degree Celsius, and disabled
> when it drops 2 in unit of thermal value below the threshold. While
> enabled, driver checks RSSI of each station in every track work. A station
> is limited to a TX power cap of 3 dBm if RSSI is not lower than -23 dBm,
> and released when RSSI is 3 dB lower than that.
> 
> DTP is not applied if the channel is noisy. Measure NHM in background
> during the interval of track work, and decide a channel is noisy if the
> ratio is not lower than 2%, and keep it noisy until the ratio drops
> below 1%. If NHM gives no valid ratio for three consecutive track works,
> don't apply DTP. Program per-MACID power limits through the BB wrapper
> and enable them for each active PHY, retrying the enable when a PHY
> becomes available. Currently only RTL8922D supports DTP.
> 
> For debugging, add a flag to disable_dm that DTP can be disabled.
> 
> Signed-off-by: Hsiao-Yung Chen <henchy.chen@realtek.com>
> Signed-off-by: Eric Huang <echuang@realtek.com>
> Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

2c95e03cb794 wifi: rtw89: 8922d: add DTP for thermal protection

---
https://github.com/pkshih/rtw.git

