Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397750;
	b=oXzbT/nPXlnDCVq0/2/N7lLr0LCy3NVJL8foWSjrkR3cUOTGpa2NuRdPrMy+yhVfjEXd
	 kuN8Bo7rdNE0Q+Y6QCA0n9S3VdWiAOqf5CxnX+SFjqV7SjvVJ5+gd/7dBMnR8OxpJdIrs
	 NcWlZR+ahL3pdcd0ud4zMYxyJSwMfVQEfgKPafk1095ukjF0DmDPgPwWfYTyGUu4fTpsy
	 uMbOn8TpP+BNwCu/RaOzAeY3/FTuACblwYDWgQuFvNykkNcp8sg0GEnCXRg1hO2P4ixZA
	 FXXizpryOWD2j2PDnpy67uNA6CIYIKXP8IQ/eLQqzdW9m/BKC5e2OAuQo2bs0WON18A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397750;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	bh=y98ftDp/lih4jNRQh6Ujz2pOnbGhFINQ0G48WEObppU=;
	b=X6EoRa1MAkhXj4NLKc93ZATPTqb+4tTbyQnoNqMsthsGHAT2VwYGgGF7u7bVl4ctfBI/
	 iLvxn0I9PIBt0lUWHj5JYTpIT4WNwLiHnXaBFGYwzqtsxeIXCiHW566OI0Xz4HZh7aBS1
	 nj3MFIjPjlEL02YVJJlCk8qcCMSgBD2T+lPOmrucrF1zQPt4HJ5JPU9ZQy3o6E7KpW16b
	 OlgGkFutG3zwksMVAGYOxRfwiaNGn4UQu/qlYcHsCOSZ7qmyEIkDkaI2d+piHvHjS+pLQ
	 5DzAA6i1h/nBmZVSnU74Q0SGSgaHOuJtGuwFykOm4fbemST/j9lVOGz2qMTJ2LOQ2kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=bRj0nPGV;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E733E606A31E;
	Mon, 23 Nov 2026 01:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E733E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=bRj0nPGV
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AN1ZOSW01203302, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795397724; bh=y98ftDp/lih4jNRQh6Ujz2pOnbGhFINQ0G48WEObppU=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=bRj0nPGVdazd57Isp4gG6b6J995V07AAoavGWaA2s0sKfopCfbndXZFy4U/VTz8t1
	 rKPY4cZ+RVNJUgRXJgY2lnFEXSQvcQmqu22USINVqnlaexVAbtO8VY+STM5NjwluJQ
	 vdFG0uHWGbErPCFWGpMBLnnKv3uybBtlbFTQQIdfIZskjs9jZea2IyIHpcokhbsfgu
	 FKCuHx269KK4nIHxyi4lGHfzGWEkA46CdR665/gGT+6UaIbCD+bbbibS9xUUtvHPSx
	 RFH3w7zvIZJg7CsolElkkV1T6b7TWf8OTZqr1VUfULHDg/g6s/s5PHeHxc5OMCop8g
	 Axrvrj5w2oBvQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AN1ZOSW01203302
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 09:35:24 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 09:35:24 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Mon, 23 Nov 2026 09:35:19 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ahmet Zeren <niko3x@proton.me>, Jes Sorensen <Jes.Sorensen@gmail.com>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Ping-Ke
 Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
Subject: Re: [PATCH rtw-next v2 1/3] wifi: rtl8xxxu: honour the rate of injected frames on gen1 chips
In-Reply-To: <20261122-b4-inject-v2-1-0ee720fe706d@proton.me>
References: <20261122-b4-inject-v2-0-0ee720fe706d@proton.me> <20261122-b4-inject-v2-1-0ee720fe706d@proton.me>
Message-ID: <490b93e7-fe3b-4245-a3e3-0c697c61dbda@RTKEXHMBS05.realtek.com.tw>
Date: Mon, 23 Nov 2026 09:35:19 +0800
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

Ahmet Zeren <niko3x@proton.me> wrote:

> From: Ahmet Zeren <niko3x@proton.me>
> 
> When a frame is injected with a rate in its radiotap header, the driver
> ignores it and leaves the choice to the firmware rate adaptation. On a
> RTL8192CU every injected frame went out at MCS 7, whatever was asked.
> 
> Use the injected rate and guard interval, and disable rate fallback so
> the frame is sent at exactly that rate.
> 
> Tested on RTL8192CU (0bda:8178) in monitor mode on 2.4 GHz: 1, 5.5, 6
> and 54 Mbps, MCS 0/7/8/15 with long and short GI were all received at
> the requested rate. Frames without a radiotap rate are unchanged.
> 
> Reviewed-by: Ping-Ke Shih <pkshih@realtek.com>
> Signed-off-by: Ahmet Zeren <niko3x@proton.me>

3 patch(es) applied to rtw-next branch of rtw.git, thanks.

50b9e3778de9 wifi: rtl8xxxu: honour the rate of injected frames on gen1 chips
b2ccb6a04761 wifi: rtl8xxxu: honour the retry count of injected frames on gen1 chips
30f5119c965e wifi: rtl8xxxu: honour the bandwidth of injected frames on gen1 chips

---
https://github.com/pkshih/rtw.git

