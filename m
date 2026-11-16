Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842895;
	b=D/B66uR4EcpEU73Eq7gW1bmHZDJExue6mMnzI/+FedhTIhil1pzdb/xrZnYZfGwtLiWp
	 30uuB6UROaMoanjKTPSHDxEj6HEGRXGDIxv+lXbPoCwm4mlVZL6HKiC/UdJ479mIUB+Ef
	 0+tzmS8jumnZ3iJ0jgXlQWhEwW/Uhta2cH1YEAth4CCZKn9bVZVN1zElMGFL+76SlxJbh
	 6Rx0W3sUlkAYFzkPBOlPA/YycJZWpi7AGGVPd65Y14oJaG7Vyhn4nAO7VlxFOwfWFY5Tk
	 lVyHxonyjw01MWzTeilFnqr2mU46vb9B6rin5FBch4zziwrrqqLwU2963bTyxxb3zlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842895;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=DaNCGELeoqf/kBgZ/JGsGFJqfT2kIMLzcQltYGxJTyk=;
	b=CNaVvAG9heGm5yGubyuMha+TFnaHTJrrjYgx3foH3P+RBcA4ZLOGA1Ia14Qum8IUt+nX
	 6dG3v0lbxUgFmTRjtPeCu+WNsJbn1h4oI586dfmrnh9BCeX/w4Zx1RIuHHPB4oFNsvaTK
	 9p+5e0Kq/TvehH2pG6OwcTh/aY54aP8RCzoQzeDkFn1xkC/6vG8lFj5gITygmzlCl0SF3
	 ze9eRFn/jxTsANe5PtIT706vYtcwV/gEzS03drHw3sJVPiDKozkGanR6yzfdm9+ejs4I1
	 ivjpP/Nb3i/PoRZPCtfz4CnCWeYtbHG8+vQwNhYV+618YGJ9FFDf82F8eCIyLR/PeWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b="D5/McIM/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.52
Received: from sender5-of-o52.zoho.com (sender5-of-o52.zoho.com [165.173.182.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DCE606A32C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86DCE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=D5/McIM/
ARC-Seal: i=1; a=rsa-sha256; t=1794842890; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lwCbJ1SFowNiToyRx6WPIbTd3imeAJbsn2pVtOKjtSsiwppeqiHAdRCo0a+FZpsqDY5ABOH56quvtmVlDuq8Ftj3ZRp09xbyERB3X2cwZeqxsjV3jWZMs0AQIl8rgEh+IYHUOz+XJVzom+M/wa114kVE8phQu7quqJg8lB2T9A0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794842890; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DaNCGELeoqf/kBgZ/JGsGFJqfT2kIMLzcQltYGxJTyk=; 
	b=MBcksPACKpvunv6b5tyum1Z4yI6lOk5kjy9/jpRxNiK7Bscy20Zil/RuPvUPy6dyupyWcuY4Q0WwQMRSrL2nMXT7DCoj9wpqb6zkYSA6P9wYwB5PSQhc9dwhf7qy1QGDwTp//k3g4UloW/VshW3lX/ceqpWeWp2u3fhIdH2JQE0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=D5/McIM/mDT1Nqu67uDVJt2umwKdwMNiyXlrayvpjEvqloO64aNilCjxgkLCZX5quNhLRNkOA83Tdsk6geehuBBkBOSOp0MQ/gTTdkCqAkhou2R56iyMmYmqq+DlNZNvX9jyvKJ3z0pk6Qa0xsbOEufy86p5M6tq2FedY3qXb05yx3N1Vf98H2b23Mcepd2ay/klOr/1XHlz1dUHJ4n4Z3iQ6d4d7jJSgBJzwCqijerxgzdOksVTYx19IU5QwCl8ciAOR48KzRPE/enSrCOGQh083qdxy+uzLkBMOrub07bMR0+w16V1xZ9mZ3KN1HexbXHTOp7i06tpGw1S11/7Gw==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=DaNCGELeoqf/kBgZ/JGsGFJqfT2kIMLzcQltYGxJTyk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794842888901615.4241762237168;
	Mon, 16 Nov 2026 07:28:08 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC net-next 0/2] wifi: rtw89: fix monitor mode RX filtering and enable raw packet injection
Date: Mon, 16 Nov 2026 20:27:51 +0500
Message-ID: <20261116152804.781-1-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20d94549347146e0b25926f7e91e1101@realtek.com>
References: <1a196d6dfbc.35537d221913104450.3720060455831933789@zoho.com> <1a19b7cce82.5dc2e93-44860545.1830508576953059669@zoho.com> <48b6758afb7844c8bdd6d8b775fd6bde@realtek.com> <1a19f4ae04e.52fd7adc-309223923.5560034215405031423@zoho.com> <20d94549347146e0b25926f7e91e1101@realtek.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Sun, Nov 15, 2026 at 02:57:21AM +0000, Ping-Ke Shih wrote:
> I thought the B_AX_SNIFFER_MODE set should be included CRC_ERR packets. I'll
> check this internally.

I tested this on RTL8852AE with rtw-next. With 0xCE20 = 0x03174439
(B_AX_SNIFFER_MODE = 1, B_AX_A_CRC32_ERR = 0), 0 packets with
RX_FLAG_FAILED_FCS_CRC are delivered to the host; setting BIT(11)
(0x03174c39) delivers bad-FCS frames (48 in 1.8s on ch 1). rtw-next
already toggles B_AX_A_CRC32_ERR via FIF_FCSFAIL, so that part works
as expected.

> The 0xCE20 I can see is different from yours: (kernel 7.1.5 without any change)
>
> 1860ce20h : 03174438 55555555 55555555 55555555
>
> If I use the latest driver, the bit B_AX_SNIFFER_MODE is enabled (after 7.2):
>
> 1860ce20h : 03174439 55555555 55555555 55555555
>
> Can you try the latest kernel without any modification?

Confirmed on rtw-next: standalone monitor mode sets 0xCE20 = 0x03174439
and already captures broadcast, multicast, and other-BSS unicast data,
management, and control (RTS/CTS/ACK/BlockAck) frames without any RX
filter changes (my earlier 7.1.5 test lacked B_AX_SNIFFER_MODE). Since
we are focusing the series on standalone monitor mode, I will drop the
RX filter patch in v6 as well.

> My test results are the opposite of yours.
>
> The standalone works well to me, no vif = NULL case.
>
> For concurrent wlan0 + mon0 case. I up two interfaces, and run your script on
> each of them.
> If I did inject on wlan0, it obviously can't send out because vif type isn't
> monitor.
> If I did inject on mon0, it crashes as what your first patch want to prevent.

You are right, I had the two cases swapped in my previous reply.
Standalone monitor creates the virtual monitor vif, whereas concurrent
wlan0 + passive mon0 has no virtual monitor vif and hits the NULL vif
crash when injecting on mon0.

Thanks,
Enver
