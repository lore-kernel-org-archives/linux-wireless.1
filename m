Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.28.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527878;
	b=iFNlE0w4n5t1pPxV+/Ad40MEsfPgVHE//77Mz7WwgyxeHGCN2Vvafnl1IbnSGYu4L42U
	 o+ORjIvWWQjrE5wIuWkOS45ufweybr4aQT51y0MYMhQvQguoel3uDSFtmP3PRlxhbMB2F
	 u+s4iSW7+8N2q9mvAhTVv4F5D469xYS4IjQlCwM3CY33MixWEQ4uolcBUzSat+kxo/pYQ
	 +8OtowdaI0owxI3K7hKWEbccmEqjNKXPYNQfhpEG3bZS51ep1nmt0Zw4ub2Q+oVVyVF+D
	 5mLvupGwcus9IFlrvfc2Te4gslzVKtkkHMvdsFz4yh2aMN7wDJBwD67bvaL/rIsSoKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527878;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:User-Agent:Content-Type:MIME-Version:
	 Content-Disposition:X-Virus-Scanned;
	bh=A16SE5U89pwDGWMM5cRIYJQOtV6GaxtAqfSvrdQ9ILk=;
	b=vFN3WxLFONILyMSX74OtsxCHKyx/bXsI5L7HJj8AFb2ErkPoLAlE5oBaGn9b4tRdIkOl
	 1GQCw1tyBJO0CqSGtK0tvfNYeflSSg9qjgxGN6s5PFikZN3Y9koatdXfgfsPI+SDBoy4W
	 kgNeSXK3QKyCBnN12HFjmMKSnap9KYf0jqQ+sz2JzJE18y4ML2KcxkMvQuR6dgu+Zhrq9
	 614M2mRxlnX22bRmwUXKblsPfoFDXRpIR6A77Yh78glZj7T0JsuK232EHG6RpYf6qH8D7
	 pP2oJArtE5OToAq99z98KoRhw2h/cY1VVMIs4fwTCJ4ncc0AMxPOBS4t/l97gKoDy6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfdeck.de;
	spf=pass smtp.mailfrom=rfdeck.de;
	dkim=pass header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b="HZzjC2I/";
	arc=none smtp.remote-ip=188.40.28.6
Received: from www226.your-server.de (www226.your-server.de [188.40.28.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408C7606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 408C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=HZzjC2I/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rfdeck.de;
	s=default2609; h=MIME-Version:Content-Type:Subject:Cc:To:From:Message-ID:Date
	:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=A16SE5U89pwDGWMM5cRIYJQOtV6GaxtAqfSvrdQ9ILk=; b=HZ
	zjC2I/643PlMjnP8QgLD0uG/2Naih1mwV5AVCyV2QwMP68IUnX2DuvX89fI4uGbjVrXFRcz9HTRtm
	xHrmwLOJyiQyPthwHWwEBoQjZ/DVU6NPp46NBaNdOpSoWui7D6V6aJ1/TJTUuBHjWXWHFXoYEvXKs
	LOztkuX+w0oqUGQg1Mvhb7zay1vjaXkdkJGlgCFeJQmGEpwTXvSH2F2Zc/tg16GcJ6rR9tsQpwfxr
	pXlreXuwzCwSZi/B51EiMv2ow3VgLaLbLUX6mJEFz9hJ6ycWVrcvZDQyIwdVR3KrReu63jn+s853K
	hyG7wT2QU7ODaQd2kq9uFfSimNsaXcRg==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www226.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <martin@rfdeck.de>)
	id 1xVqou-0001dM-1S;
	Tue, 24 Nov 2026 14:44:28 +0100
Received: from [192.168.0.30] (helo=mail.your-server.de)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@rfdeck.de>)
	id 1xVqou-0006lR-2W;
	Tue, 24 Nov 2026 14:44:28 +0100
Date: Tue, 24 Nov 2026 14:44:27 +0100
Message-ID: <20261124144427.Horde.qQ_UTCx-6LmjjeS1bojTj8-@mail.your-server.de>
From: martin@rfdeck.de
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, martin@rfdeck.de
Subject: wifi: rtw88: usb: AP sends no beacons after monitor capture on the
 same phy
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: Clear (ClamAV 1.4.6/28193/Tue Nov 24 07:27:44 2026)

Hi,

on rtw88 USB adapters, an AP started on a phy that had a monitor-mode
capture session before sometimes never transmits a beacon, although
hostapd reports AP-ENABLED. Neither the driver nor the firmware logs an
error. Only reloading the chip module recovers.

Hardware/software:
- rtw88_8812au (fw 52.14.0); also seen with rtw88_8814au (fw 33.6.0)
   and rtw88_8821cu (fw 24.11.0)
- Ubuntu 24.04, kernel 7.0.0-43-generic, hostapd 2.10, regdomain DE
- same behaviour with a v7.4-rc4 mainline build (Ubuntu mainline
   7.4.0-070400rc4) and the same firmware

Test: module freshly loaded, hostapd for 12 s on channel 6 (about 110
beacons expected), beacons counted by a separate mt7921u monitor on
channel 6.

Sequence that triggers it reliably: a capture session with Kismet
(monitor vif added on the phy, base interface down, channel hopping
including HT40 and 80 MHz, 15 s, then Kismet exits and leaves the
monitor vif in place), hostapd on the base interface (116 beacons),
a second capture session, hostapd again: 0 beacons. 12 of 12 runs on
7.0 and 7.4-rc4. AP -> capture -> AP was silent in 1 of 6 runs.

On 7.4-rc4, with the capture source closed while hostapd runs (20 s)
and reopened in between, three APs in a row sent 230, 0 and 0 beacons.

With iw only it is sporadic:
- monitor vif deleted afterwards (20/40/80 MHz, with and without a
   packet socket, several orders): 0 of 9 silent
- monitor vif left in place like above (add, base down, vif up, tcpdump,
   HT40/80 hopping for 10 s, vif down, reused the next time): 1 of 3
   silent on 7.0; on 7.4-rc4 one of two pairs had a silent AP

With rtw88_core debug_mask=0x80020018 the logs of a working AP
(116 beacons) and a silent one (0 beacons) look the same: start vif
mac_id 0 on port 0, the same reserved pages, the same H2C/C2H sequence,
stop vif. No "error beacon valid", no "failed to download drv rsvd
page", no "failed to get tx report".

Not the cause: HT config (ieee80211n=1 or not), changing the MAC
address before hostapd, waiting 5 or 15 s after the capture.

Recovery: ip link set down/up and "iw dev ... set type managed" do not
help; modprobe -r / modprobe of the chip module does.

mt7921u is not affected by the same sequence. airbase-ng (injection,
no AP mode) on the same rtw88 adapters keeps working.

I can rerun the test with other debug flags, another kernel or a patch.

Thanks,
Martin

