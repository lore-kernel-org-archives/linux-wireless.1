Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795752024;
	b=cMVyWTCZqOK7Z0xCzFCPyHQkaa+HwrrjmrLksDpwtizLVB4U0+BSlX9WWkXHVKutkB7V
	 4EDjlZuL0oUJ2LpxEMY586x2qHnmiym7Qwc9qRAqDlH262H3S3zsjYmJ06q51AZhx8JRp
	 7h6LCq9F5sEeYs6XywhbMKu4EhMzKi2kqOxMctiZn8MvJoEVGsfxV26ss9y4aU0PowEEW
	 6SOZJCgHV7W6XIDZ6KPjLMjQbmH1rocG8sBx64vGPhTe5+pWf90cB4Kg3bCyUm8bSpgcg
	 litirV+ng0Uawq0ScwUmZW2YNRxRJMcKuA84fECdl9WB3ga6y6XGMQXV39lQ3b1AI5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795752024;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:Date:MIME-Version:Content-Type;
	bh=M8C7ga81IPRqCL1i3kg2JzHWzivLKf2pHR/M315X9PY=;
	b=sWffmxY+WbyfUo/Np9Ay0+4O9sjMLRVRqpFbJZXs422Y7rXkJ4T9X+xF2y5KfqLiiGiL
	 nOv/sJszI6qZLd/xe8rov/TLCKW3QOQDhTl7I1V6Btxu8uNB7ZmajUbz3kxw2Gh7KrQto
	 3eg0zx1H1fu7fKLOFBHTrPTi3qUCWYx+PopKio+j2hEA9HA9RUZ0qkXncZYqov30Tv01H
	 fgRbPxzLf7Aii1o66u26RXxoGpyEzQidf6UmkkegEZcssYO8X9z4X/lwbdLSlqylZN7rC
	 3+DI+iwyYxSvvSjKy6jkSQ/3lWXE4fwbKINQ/lZ+mAmMeP71iWQsWyfSmVVx6SCF+AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=hvpVxbCc;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59CE606A32C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 04:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A59CE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=hvpVxbCc
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR40KYy8605473, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795752020; bh=M8C7ga81IPRqCL1i3kg2JzHWzivLKf2pHR/M315X9PY=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=hvpVxbCcKqgfxYmoj6bPQjHrcIv8KTvf0PDyvTvtKPfcAytxykjIIOL+N+SMUkkEm
	 qOsv/XwftoU0vTVd8G8VUIlovuFrxxI52LgVRj95CC0xAR1x+2WsSj5KqXAb+cpuw6
	 W21trl5BirjKIgIxnl+zrUKkeuiIdGU2ApepSBg1crc+owQQgbgFZYxc+xFKw/3FPb
	 WqSGIluiugmdPYrL5YobrPyTXXtTb8kv+d9D/jNY221/DKD4m5HavLZ4RkWm9MZd1c
	 RNixPv+fvuTZTwzVnMYaHNO8RsRfQIzqiSRj4nujbCx4NwK0mccShn7eSJ5ngOJNBx
	 oIjft5YseqE3g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR40KYy8605473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 12:00:20 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 12:00:21 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 12:00:20 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Fri, 27 Nov 2026 12:00:20 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ping-Ke Shih <pkshih@realtek.com>, <linux-wireless@vger.kernel.org>
CC: <echuang@realtek.com>
Subject: Re: [PATCH rtw-next] wifi: rtw89: 8922d: write path diff registers per PHY
In-Reply-To: <20261124082825.27916-1-pkshih@realtek.com>
References: <20261124082825.27916-1-pkshih@realtek.com>
Message-ID: <b7734142-7c00-4a7d-beae-55e578242eba@RTKEXHMBS06.realtek.com.tw>
Date: Fri, 27 Nov 2026 12:00:20 +0800
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

> From: Eric Huang <echuang@realtek.com>
> 
> The path diff tracking runs for each active PHY, but its registers are
> written without a PHY index, so PHY1 results overwrite PHY0 and PHY1 is
> never updated. Use rtw89_phy_write32_idx() instead.
> 
> Signed-off-by: Eric Huang <echuang@realtek.com>
> Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

43884e9528b6 wifi: rtw89: 8922d: write path diff registers per PHY

---
https://github.com/pkshih/rtw.git

