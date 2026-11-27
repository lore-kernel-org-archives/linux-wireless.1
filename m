Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750996;
	b=2A7Pcbx5boOzHhgAGr7vKPgJPP/B6t341cBmgT9x+1H+zMNJXZQ8xAt4RjyAlKfVaxxs
	 d8owTKA3h6qNGZKHSGfWU2Yb7KrifMGcbkboTgKRUnl8pRLlIn8M/teFga/GdtmFeuLOM
	 2C2x9Tzg06jwViJVtLNdvJpfi+uq6AUIWVzrud4XcIhhyRzFyd9eha4w8q8LX9sF2xZr7
	 gigqwCT26lX0j0nMGl6TLI+J4v05g4kXzfonunFKeyzAeK74MEFtuOW6DWQdwExie7ZuX
	 +WvnoVlZowz+ZqG097YfccFmE7wvVlbWC4ZGtuagmB+pEE5id2/ZAlbZ0e/QENdbVGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750996;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	bh=tCLRQllEtvIxVJs6oOVbhql0a9swE7G5CpzgPbgiC0c=;
	b=vOzvhGfYRoC3v/D85p8PZMs42zZdEUo5dW9FyJByUcvRWVvR1t7YfhbEzsSVWf5d/32N
	 dfHsYGfb78TET4fZRikYpBH2S6hb0gx5gd3aGKhLrhDqAdKw5PQhPc9c9Zzf0YG4cHwJI
	 He6mfgUKGvc46Zte7+AJuBPdzh+B/mcFfliEPAwXx4ro8Stc10JnY7fZiMTqcaHHHthma
	 ZOBF5e/pBa9EHvPBU2fochIulOnHHk94rLugoAfUWLvxf07F1SFlALvF89AJdABadK19O
	 xenouDc0NBhhY3BxdPw8LxZsOFdxDbqk+McDj5yCY+P4VsNI8uy7bytceaAH+91UjVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=QB1tsk3u;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D2A606A31C;
	Fri, 27 Nov 2026 03:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0D2A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=QB1tsk3u
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR3h58M1598243, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795750985; bh=tCLRQllEtvIxVJs6oOVbhql0a9swE7G5CpzgPbgiC0c=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=QB1tsk3u8upihn5jhBfz/TmtcQzUtCp8iug0wbaRMRnCp2BSa/daORit/9ZcYJYTi
	 doYxAEXBA9Bw50uOq3cdrxgMVCD4rNJhowvITAhUdWBdyjHIM7dYQ2M3SuJj3wuTUx
	 Fe+mSBOrBiToQAsJUom58Qn+1jzBKEsqIHq7tKvXQGnQidZ3NHmQw6Ufb0gynWywnO
	 34FXgboaXn9PK1tyOaPd10WCRidgPOFB44wNfKaMzll9Hgsb477a2c9ghf4RrUhJB3
	 ub/bUOHuWzRAJqch29LUgrSIWcuNbPHLJ3VEDDF1biSo4rAE0h6KfEhXbFt1JlbfIL
	 NSDfjeCu6/Iqg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR3h58M1598243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 11:43:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 11:43:05 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Fri, 27 Nov 2026 11:43:05 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>,
	<linux-wireless@vger.kernel.org>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH rtw-next v3 1/5] wifi: rtlwifi: rc: start no BA session for QoS null frames
In-Reply-To: <20261120113116.153232-2-hjf3108@gmail.com>
References: <20261120113116.153232-1-hjf3108@gmail.com> <20261120113116.153232-2-hjf3108@gmail.com>
Message-ID: <2ae2b12b-8899-4512-bf13-4bb61f62299e@RTKEXHMBS06.realtek.com.tw>
Date: Fri, 27 Nov 2026 11:43:05 +0800
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

Ho Jie Feng <hjf3108@gmail.com> wrote:

> rtl_tx_status() starts a TX BA session for any QoS null data frames,
> so these polls start a session even though they do not carry data.
> That costs an ADDBA exchange.
> 
> Check ieee80211_is_data_present() instead, so only frames that carry
> data start a BA session.
> 
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

5 patch(es) applied to rtw-next branch of rtw.git, thanks.

ff88e5a42f4d wifi: rtlwifi: rc: start no BA session for QoS null frames
d25adca7a8d5 wifi: rtlwifi: rtl8192d: report no signal for frames without PHY status
a7e88f471d76 wifi: rtlwifi: usb: unify the RX code path
a1abc7b44859 wifi: rtlwifi: usb: move the radiotap headroom size to usb.h
0dc0f16658a4 wifi: rtlwifi: rtl8192du: enable USB RX aggregation

---
https://github.com/pkshih/rtw.git

