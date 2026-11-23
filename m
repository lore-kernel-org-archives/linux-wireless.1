Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=129.217.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440061;
	b=lOyoKZs0Csu8P5N5IpCjbk1MKtWYo3JjnKVjnKzdD94LUQs4xkW4hgjoJPgU+4ASSaAZ
	 /de4kjL92jHOsVBiFiQJ8T4Mfx7aCiugHs1LsT8xdtFUs62H9OIegR74R3Y2H+PFz+ePf
	 IpTNldGXpUY9xUDUAc8vgpJ6VgnI9OYm2hd13ZmZkDKQL46THxjS0QndaOAQ5B7p8AYXQ
	 oBtbLrp4sfW+5Rh4Frxk2XCF5Ljlqkm3uwxV0YUx//VLJZZfaUENJdE2MvhQDolS6IBpo
	 +yMs7PvBOczXxwpSIfYbAQhRf4Vc64Xf57GAQ1rjj5tlG4a6pegtxu7QNWCLLv8sLRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440061;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KKPrQd2WAHkyE4BlWPw8S75TlnmJKjuMqhRQVg11soQ=;
	b=CJr/FHzPqgSjYiXsjRIVVCS6A2tl5DieOkGcwDwuFevm4YYGo7aAoRX9vAKcPlHEDRTY
	 TPEbM160ho1vie+Ne6XIxaPokeM+MP4iz006CYi4hxXpYba2FcHlWtmqPUvy3Wck0NThC
	 nQ3WZoZu8lH1L1GDw70k8Hr7M5dDkJZhi6mcTWoLn/XLQCngHMKwHL7ZHm/dw3/CArEW8
	 ieAYbT4ZQ8lFQI7euAOCSuNIJw18yRK95TaSp7Ydc3kfA9+y/WxwVofHBwOuYQvGSZMw0
	 +R1QMHT3viRMhVHyp+Y9C7gs39O2xvDTAGrW6L3E1EpVwh6WUXe1l95AhT0E2eiFx2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tu-dortmund.de;
	spf=pass smtp.mailfrom=tu-dortmund.de;
	dkim=pass header.d=tu-dortmund.de header.i=@tu-dortmund.de header.a=rsa-sha256 header.s=unimail header.b=IK8ir8Yf;
	arc=none smtp.remote-ip=129.217.128.51
Received: from unimail.uni-dortmund.de (mx1.hrz.uni-dortmund.de [129.217.128.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DBF606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DBF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tu-dortmund.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tu-dortmund.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tu-dortmund.de header.i=@tu-dortmund.de header.a=rsa-sha256 header.s=unimail header.b=IK8ir8Yf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tu-dortmund.de;
	s=unimail; t=1795440056;
	bh=KKPrQd2WAHkyE4BlWPw8S75TlnmJKjuMqhRQVg11soQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IK8ir8YfCK2a2rKhd0b7h2mDa8Rw402lW9XSYAMM4Zbim82jmXlJFo8MAL8QIAoUi
	 Mjuo3SzLDLJ/PPJJ+K0AA3iCBcX9neigQwwn4L0FGLcHtjvEzfV6n9sgQHUDmOX8xs
	 A4hLe53vxXTqG7okkMuveQDSLyvmqNhP7AdRqVfs=
Received: from simon-Latitude-5450.cni.e-technik.tu-dortmund.de ([129.217.186.115])
	(authenticated bits=0)
	by unimail.uni-dortmund.de (8.19.0.2/8.19.0.2) with ESMTPSA id 6ANDKuTs005481
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 14:20:56 +0100 (CET)
From: Simon Schippers <simon.schippers@tu-dortmund.de>
To: Florian Maurer <fmaurer@disroot.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Subject: Re: [PATCH wireless-next] wifi: mac80211: mesh: notify driver of peer capability changes
Date: Mon, 23 Nov 2026 14:20:55 +0100
Message-ID: <20261123132056.345999-1-simon.schippers@tu-dortmund.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101130636.1867958-1-fmaurer@disroot.org>
References: <20261101130636.1867958-1-fmaurer@disroot.org>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 11/1/26 14:06, Florian Maurer wrote:
> That flag is set by rate_control_rate_init() only when a software rate
> control algorithm is in use. With hardware rate control
> (IEEE80211_HW_HAS_RATE_CONTROL, e.g. ath10k, ath11k) it is never set,
> so every call ends up in rate_control_rate_init(), which returns early
> without software rate control, and the driver is never told about the
> new capabilities. The firmware then keeps using the rates from the
> initial peer setup, e.g. legacy rates when the peer was first seen
> without HT, until the station is removed.

I had Claude Opus 5.5 set up the tests on my hardware and went through
its setup and results myself. They seem legit to me: the bug reproduces
on ath10k, which you had not tested yet, and the patch fixes it there.

Setup: two TP-Link EAP225-Outdoor v3, QCA9888 with ath10k and firmware
10.4-3.9.0.2-00157 on 5 GHz, OpenWrt 25.12.6, kernel 6.12.112 with
backports-6.18.55. The patch is backported there behind a module
parameter, so that both cases run on the same image. The nodes belong to
a bench mesh that runs wpa_supplicant; for the test each of them gets a
second mesh interface on the same radio (channel 36, 40 MHz), with its
own mesh ID, open, kernel MPM.

The rates below are the rx bitrate of the peer, what really arrives.
ath10k reports a legacy tx rate of 54 Mbit/s as 5.4 Mbit/s in the
station dump, so the keeper's own number is misleading there.

Without -> with the patch:

 - The peer first peers without HT, then rejoins with HT40+ while the
   keeper keeps its station (4 runs each): legacy 54 Mbit/s although
   mac80211 has the new HT/VHT capabilities (debugfs ht_capa/vht_capa)
   -> VHT-MCS 9, 40 MHz, NSS 2, 400 Mbit/s.

 - HT40+ first, then rejoin without HT: the firmware keeps sending
   VHT-MCS 9, 40 MHz, to a peer that no longer advertises HT -> legacy
   54 Mbit/s. Here the peer's radio still decodes VHT, a peer that
   really lacks HT would not.

 - HT20 first, then rejoin with HT40+: stays at 20 MHz (VHT-MCS 9,
   NSS 2, 192.7 Mbit/s) -> 40 MHz, 400 Mbit/s.

Acked-by: Simon Schippers <simon.schippers@tu-dortmund.de>
Tested-by: Simon Schippers <simon.schippers@tu-dortmund.de>

Thanks,
Simon
