Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504085;
	b=BQ5SApocuWNH1DOFA7i4xzOtfppZcNZilOIGeBvdxDhavuxzSQPVx+P/a5IpJUWyu2pN
	 60EOMo+j6KJTlRFoRRdqe1looeL/trmVdeQJEUvpCTaGvYnRcrq2X2OMbMlbmIbM9E9DN
	 Bb3u3DGsOz/9njXLhSgET7NMA9cHR0oPX3N45wE3DzTvA6rQVy96964yh7WLed/w0EGrx
	 V2qqDihCYN1j31wiP31gVpkv7wYKYQOijEY0yLeFHgD6iVpB+bJA84UVxhAYyFCGLn9Yc
	 tcU6fKQKzoVdj9n8TbYqi//FvF1ZyXIj25+opSwi3Bd0VkiylkKykT8XqjYGrLDwQCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504085;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Feedback-ID:
	 X-Pm-Original-To:Received:Message-ID:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:Content-Language:Content-Type:
	 Content-Transfer-Encoding;
	bh=Lj9j3ZvrwRx0Nejbw4yXp8DQLDpD+MS4f8ANucpuTNk=;
	b=23ynhK6chFpnP6TifKEmDrVKXZoq5lcr8ui6R3lXvdZe6A10iXzpGmJCmynuRRaVy5ci
	 mtOedKU1xQV+5RgYQ9MBuO51uv0YvD+AKZvPHUfFBUevTPmmiXvSG77Lz3oXPng+FnP9r
	 9xIy8esImIts6NElCaQNahYxqN8vGqI29DO1DhfAegoPgFY4rxgFHq3HlIrE/i4eLcS5Z
	 xx0ZiR8HlaSf2rGIhg8BCnNmtAin/usJ5AeRytL0oLQs5di5REd1dfj+9ygl/Vu1SOyQp
	 A1OE1vNARnHk8853u+s78N2mCVK3sWq7dNwecxpfnMvf8pVOzTmFzOmCQiYaQwNy2JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jimmycushnie.com;
	spf=pass smtp.mailfrom=jimmycushnie.com;
	dkim=pass header.d=jimmycushnie.com header.i=@jimmycushnie.com header.a=rsa-sha256 header.s=purelymail2 header.b=TzybrUZ2;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=SDURzBNr;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF114606A32A
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 07:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF114606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jimmycushnie.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jimmycushnie.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jimmycushnie.com header.i=@jimmycushnie.com header.a=rsa-sha256 header.s=purelymail2 header.b=TzybrUZ2;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=SDURzBNr
DKIM-Signature: a=rsa-sha256; b=TzybrUZ22rKhNLDcXROputqVq3Fjt57gaJaaC/LWQbGQySz229kRWdy4yJKpg0GGn3feeSCZimtnp9MOSuDZNzW42VUNoY6ygVpD6YCjNjXygyv94kcAdIET7poF54mUQ7wDocjjX6xHKJHKWCaB9i9s25dH0UEovvFjlpWJQ4uYrz1lJ2cPWdOkbFqrLjmYztOdlWTljZvojngQC1dNYz562Co67h0i3BXE+TbVACm/uhHjtWLQcVyzFgts24wA0a4m5yZ2QDlIiqAx1uWY7gqrhG+MzCsSBeua8UMl6BqEGcYXKPJbkd0jIMBO+YfgIf5jEV24hPg4jYAbcMGAcg==; s=purelymail2; d=jimmycushnie.com; v=1; bh=IttPsrvZksQs/43Y7DEGq/7nnt+fPpyWi2cclFe1Wyo=; h=Received:Message-ID:Date:From:Subject:To;
DKIM-Signature: a=rsa-sha256; b=SDURzBNrSPIUjKyc6UoV4jzlPFMM1caZa7cR4LfnqW+blVZjWbRlYC2jnZFJ8QFowqLTRnMNiER01VmSI5RyzwF+rZnf8h/emuGG35kj3fHqnq15Pa1sgwBYT4HSlcsMgSW15sr4fNUZeu5ukx9P5LmnFW0ufugrWeAijJ7we7odLt3lO7V6/M416LDHCCK0miQtzyVNm5UxyR2r7MKJG3J9EE0/QpvObPONuYrkjRhW2dvowUF9MmMk93xm9eYDg/mcj+hAgHrc+vCSbJzGHWlcpJH77fMrKlNGR2eHDzR2hBjWLb0mGiMOKLK6l7JHPKF1NFQ8kyQkAXz4BhxIHw==; s=purelymail2; d=purelymail.com; v=1; bh=IttPsrvZksQs/43Y7DEGq/7nnt+fPpyWi2cclFe1Wyo=; h=Feedback-ID:Received:Message-ID:Date:From:Subject:To;
Feedback-ID: 708593:36671:null:purelymail
X-Pm-Original-To: linux-wireless@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1096830143;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 24 Nov 2026 07:07:57 +0000 (UTC)
Message-ID: <a98a6666-1499-433f-8c3f-d7277224b334@jimmycushnie.com>
Date: Tue, 24 Nov 2026 02:07:57 -0500
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jimmy <kernel@jimmycushnie.com>
Subject: rtw89: 8922ae: ~80 Mbps TCP throughput vs ~600 Mbps on Windows with
 the same hardware
To: linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have a RTL8922AE which only gets 60-120 Mbps TCP throughput on Linux,
even though the link reports 1200.9 MBit/s HE-MCS 11 NSS 2 in both
directions with a strong signal. The same machine gets ~600 Mbps
throughput when booted into Windows 11.

Issue is reproducible on:
   - 7.3.5, in-kernel rtw89
   - 6.18.60, in-kernel rtw89
   - 7.3.5, morrownr/rtw89 at commit f2ce66e

The Windows driver that works for me is 6102.24.143.0.

My system:
- Motherboard: Gigabyte X870 AORUS ELITE WIFI7 ICE (onboard RTL8922AE)
- CPU: AMD Ryzen 9 9950X3D
- 09:00.0 Network controller [0280]: Realtek RTL8922AE [10ec:8922]
   (rev 01), subsystem [10ec:8922]
- chip info CID: 71, CV: 2, AID: 6933, ACV: 1, RFE: 1
- Firmware 0.35.80.3 (8ef4f0cf), rtw89/rtw8922a_fw-4.bin
- Distro: CachyOS
- AP: Rogers (Canada) gateway CGM4331COM, hardware revision 2.0, 5 GHz
   channel 44, 80 MHz, 802.11ax, WPA2-PSK. Regulatory domain: country CA.

Things I already tried:
- iw power_save off
- rtw89_pci disable_aspm_l1=y disable_aspm_l1ss=y disable_clkreq=y,
   rtw89_core disable_ps_mode=y (confirmed active in sysfs)
- LTS kernel and the latest driver from github
- Blocking bluetooth via rfkill

I have mostly been measuring speeds by using openspeedtest.com, but I
also used iperf3 to test transfer speeds between my PC and a macbook on
the same network.

These are my iperf3 results. Both the PC and the MacBook are using wifi
on the same AP. Windows numbers for iperf3 are about half of the
Windows numbers on openspeedtest because in this setup each packet
crosses the air twice.

PC sending (iperf3 -c <macbook> -t 20):
- Windows: ~297 Mbps
- Linux:   ~156 Mbps, 205 TCP retransmits (bursts of ~100)

PC receiving (iperf3 -c <macbook> -t 20 -R):
- Windows: ~234 Mbps, 0 retransmits reported by the Mac
- Linux:   ~69 Mbps. The Mac reported a single burst of ~830
   retransmits at 1-2 s, then 0 for the rest of the run. Throughput
   stays flat at ~70 Mbps with no further loss. Same pattern in
   repeated runs.

During transfers, iw station dump stays at 1200.9 MBit/s HE-MCS 11
in both directions, signal around -43 dBm, and tx retries / tx failed
stay at 0.

The macbook itself gets ~500 Mbps on openspeedtest.

Please let me know if I can do anything to help track down the issue.

Jimmy

P.S. this is my first time reporting a kernel issue. Please let me know
if there's something I can do better in the future.
