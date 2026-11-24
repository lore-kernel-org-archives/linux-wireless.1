Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547632;
	b=mqZ+YxhE87RrG1rAdkAUY/Lta8HFGR1JbRtpWm8RINXaH1s98tQ3161cZBpIviLDrjMG
	 FPKcxIDyJrOdgGuLOje5pJoxMEiRKSSkrrd2caKE/0/YA9Y7OrObqPylNbgfMm9O6hQl6
	 HFyNPkArStB6rFNblLFERnBzQHD+Gr1vWGp3uCr42781WCHfs3k983ZoHLFSHOI9ifJK4
	 Txf245GJEiyWo+B241BQBQ+yMyyudCUnUIFtENC49jvR8ACqgbIJD7L+WPcZcM3HPfUw8
	 ekME5fn8lbNRfdIHaCe0hT3k/RaCF1i6pwpPlJfgf4yDKXP2AWm+3xXi1p2ZOXJPBpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547632;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Feedback-ID:
	 X-Pm-Original-To:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nP/bTkY2+nX66KpAEykflHx9e11t3JGPeCdG9UHqwrk=;
	b=vxtsgN3tUdTLjMY9eLokhzUU5NxhWp3/BTTdwRlM8o4s6xIN2S0soS8jlVyagKEAxuRh
	 DvEdW8NnesINt2ZuVu0Zwbz36a4mJqcNSCg9yqVuKQOjzpMkAlMstvAUAg3WicDDlMLS8
	 02Gm9nvNZmuUymdtLC9smhUTywdZpIlp1yIu5iy2Gp/t8IJ3+s1lrgUlM+G48HbICJxzr
	 /ReIOxONFi46eKmwh9YMSKxQlr7d+gVlZxQOb2DdZMsDaM550bhnqidJ0NhV2dc/zvaAI
	 xGHoT3UMk+7pokMJ1jKkU0FlgxgEZNIAJJ4wgFBWANM1TPP+lGJTs6eziASztsz8mHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jimmycushnie.com;
	spf=pass smtp.mailfrom=jimmycushnie.com;
	dkim=pass header.d=jimmycushnie.com header.i=@jimmycushnie.com header.a=rsa-sha256 header.s=purelymail2 header.b=F+noWC8V;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b="W/fGayg6";
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6270D606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 19:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6270D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jimmycushnie.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jimmycushnie.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jimmycushnie.com header.i=@jimmycushnie.com header.a=rsa-sha256 header.s=purelymail2 header.b=F+noWC8V;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=W/fGayg6
DKIM-Signature: a=rsa-sha256; b=F+noWC8VeRt+G5N+rdLPkiflexSJ7AS6v5Tk/aM11jYi1rZcgn76zNa24vy/Ybj+QflWX9x2IwxTCYidyP4MitOkcJ+XPUHPtyEXDfHS6Kdg6tCkE6pgeT0emRTIowL1EMn8H1XvDKVQneYd7Io7WffIdz23/xgNkPUCoA1aahowXyO9YTylkAo6FNOQ1/8m2YSjfBODl12/bGO2a425WN6ihzkUeiUdystZcEWaOK/cnkI7md7lWb2YT9ibd8QhnbrHUhFPs/ebKq/+Po3NikZcwDW5nTXbgkyt2rWnWu91b26VGuvag00WhvtR2hAm1UbOcolj46etNf+I5kghmg==; s=purelymail2; d=jimmycushnie.com; v=1; bh=I8HR++gPZGG7wBhmKtZA2CK5TLrxhhF0aRESlUD7ucU=; h=Received:Message-ID:Date:Subject:To:From;
DKIM-Signature: a=rsa-sha256; b=W/fGayg6WudPCH93Fb2QSFerjHBUQaL0nkI9sBdt5+LvCbifFY/hsI8PCgGRi7t33EWZUZy2uiEcBQmw08UzTQPTYde8CP0vG3cmdPZBmXFlRkRkhbl2fNOPMuqelMXub6IZoVuMei4f164/aAA6T2Md7D2b858pQVvJJCVkmgrz0W82Fjq4ySLvK2oFC2+EuRmYytISk4rpktvwdtsyP1EcVXlHbReLKgXaBB9ipD4SYD7lu7M4mE5Zx2DtVdLXNMy7sPws1D9Vf+yhW5dp+KyidqqKI2008wd/mUAI69YJVBhbS0Yppvm+DKSC1EtolBKwQhcYF+P1BjpMcTqzrQ==; s=purelymail2; d=purelymail.com; v=1; bh=I8HR++gPZGG7wBhmKtZA2CK5TLrxhhF0aRESlUD7ucU=; h=Feedback-ID:Received:Message-ID:Date:Subject:To:From;
Feedback-ID: 708593:36671:null:purelymail
X-Pm-Original-To: linux-wireless@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1872370940;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 24 Nov 2026 19:12:57 +0000 (UTC)
Message-ID: <7530cda9-06c9-41af-885b-238eb20a66f2@jimmycushnie.com>
Date: Tue, 24 Nov 2026 14:12:57 -0500
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
Subject: Re: rtw89: 8922ae: ~80 Mbps TCP throughput vs ~600 Mbps on Windows
 with the same hardware
To: Ping-Ke Shih <pkshih@realtek.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <a98a6666-1499-433f-8c3f-d7277224b334@jimmycushnie.com>
 <c4513d04819e4b52b855e5a21c67b8d2@realtek.com>
Content-Language: en-US
From: Jimmy <kernel@jimmycushnie.com>
In-Reply-To: <c4513d04819e4b52b855e5a21c67b8d2@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Ping-Ke Shih <pkshih@realtek.com> wrote:
 > Jimmy <kernel@jimmycushnie.com> wrote:
 >> I have a RTL8922AE which only gets 60-120 Mbps TCP throughput on
 >> Linux, even though the link reports 1200.9 MBit/s HE-MCS 11 NSS 2 in
 >> both directions with a strong signal.
 >
 > It looks like PHY rate is normal. Please capture air packets and
 > compare the difference between Windows and Linux.

Thank you for the debugging advice. I captured air traffic with my
macbook's sniffer tool during a speed test on the PC, once on Linux and
once on Windows. PHY rates look the same on both: data frames are at
HE-MCS 10/11 (1080-1201 Mb/s), and Linux actually has fewer retries
(0.2% of frames vs 1.6% on Windows).

The main difference I could find is that Windows uses BlockAck way more
than Linux:

                                   Linux     Windows
   BlockAck frames sent by PC      0         30332
   BlockAck frames sent by AP      0         16455
   PC data MPDUs per A-MPDU        1.0       4.1
   Normal ACKs sent to PC          52704     3875

I can send you the pcap files privately if you'd like to look at them.


 >> Things I already tried:
 >> - iw power_save off
 >
 > I think this can affect throughput significantly. Please use iw get
 > to confirm again.

Confirmed: `iw dev wlan0 get power_save` prints `Power save: off`, even
after rebooting.

 >> - rtw89_pci disable_aspm_l1=y disable_aspm_l1ss=y disable_clkreq=y,
 >>     rtw89_core disable_ps_mode=y (confirmed active in sysfs)
 >
 > This should be added into /etc/modprobe.d/, and cold reboot to take
 > effect. (Though I think this doesn't affect throughput too much)

Yes, they're in /etc/modprobe.d/70-rtw89.conf. I did a cold boot (PSU
switched off) and confirmed the values under
/sys/module/rtw89_{pci,core}/parameters/ before testing. As you
expected, they made no noticeable difference to throughput.

Jimmy
