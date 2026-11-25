Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645933;
	b=sxzmtceOBA2T7toixgzBIwgj+TDYhLVwRXVz2pfAYNXO40dNVO48XAk5efl7TOf11mQF
	 9zmpS4Al+k/cIC/WhlH+EKVevtejG5kSl0e1xvZWXD1yhCaVL0oLOqmGQ/GYuVUOQtmVg
	 vnEUdYLBEzmRq5LNRQfxdS7aZnt64Vs5jm9CpnKXrZ5uDH7hKVKc/L/s5NQsQl4T795SD
	 0IbKYCaEgkeja6uk84NT2+rbKuvR72bOXhoHnGpDDHGIf/FFCGalxG/MghX5gWzf4PAsq
	 yPIL5Pgddj4nbYupEuQKwWbyONCHWXdCVhcJt1Y/LOezlPr/+PynkiW4S+aaMbAZURw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645933;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uc2eyZ7ZLz237JdS/r8LROuvlfaGAqWxGKfCEK3INso=;
	b=c79bxrNNrEUxiakY25eujwvdUcbPBWoita7WsP1iICkQfZuQPKGLrqEJ5Ll2Hp6DCNxU
	 Ej3Aqmopl7e9h//XLJheX22uKiEkqbFHC4o2yJws0HdMkEtXr5hZSM+jvyjYQqhK4wgym
	 s1J9R8AwYrOdpp4wQS39+H4GiQ8sE0GbAx33aEyYV+FkglajXLEW2zk/IFab6I4Dhq7QG
	 TI8SNg4uX0UztuC9vZTPgC/jUns30LuvNgq1siUIuaNSA3BkHHrxKHbrHYAzxqfwUYC6H
	 SKvAUiDFpTUh8NqANjrEdvzfxWY1vQmsG2RYPHHYT9WId2TdYfvrbzsk/Az4ZB3ziaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hRkQi3sD;
	arc=none smtp.remote-ip=95.215.58.79
Received: from mta1.migadu.com (out-79.mta1.migadu.com [95.215.58.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BE4606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 22:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6BE4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hRkQi3sD
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=APljPT37nId8ahLBoepyh9kUOw1t7x0kq/dAQCbLibU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795645930; v=1; x=1796250730;
 b=hRkQi3sDUG2cILywFTE0CMPcmEabnxF83liC2LW8kKO9O6U+dS+JGY8O9d24qMZ9wwTScHt8
 ARjpjJH5/hMWJrOYb2jVrwRIlpczYMZfu27GlTI1rp0uBBOKhSkyGRSA7uSJMANhya0f39FPKaE
 EWV5G1GP6bgqqJH1+zottiyM=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 450bb1ffd4911b3e;
	Wed, 25 Nov 2026 22:32:10 +0000
X-Mizu-Trace-ID: 450bb1ffd4911b3e
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 23:32:05 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: linux-wireless@vger.kernel.org, martin@rfdeck.de,
 Ping-Ke Shih <pkshih@realtek.com>
Subject: =?US-ASCII?Q?Re=3A_wifi=3A_rtw88=3A_usb=3A_AP_sends_no_beaco?=
 =?US-ASCII?Q?ns_after_monitor_capture_on_the_same_phy?=
In-Reply-To: <20261124144427.Horde.qQ_UTCx-6LmjjeS1bojTj8-@mail.your-server.de>
References: <20261124144427.Horde.qQ_UTCx-6LmjjeS1bojTj8-@mail.your-server.de>
Message-ID: <D34D5E6B-B159-4F34-92D8-4264024D3319@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Martin,

Thanks for the detailed report. Two things would help narrow this down.

On November 24, 2026 2:44:27 PM GMT+01:00, <martin@rfdeck.de> wrote:

> including HT40 and 80 MHz, 15 s, then Kismet exits and leaves the
> monitor vif in place), hostapd on the base interface (116 beacons),

Is the monitor still UP in ip link after Kismet exits? If it is, could
you repeat the same sequence with the monitor brought down after each
capture, but left in place? Please check that the base interface is down
too before starting hostapd. If the monitor stays up, mac80211 can keep
the device running between APs. The iw run where you brought the monitor
down still failed sometimes, so I would like to compare the two cases
with the same capture sequence.

[ ... ]

> mac_id 0 on port 0, the same reserved pages, the same H2C/C2H sequence,

The driver checks whether the beacon page was accepted. I don't see a
check that the chip then sends it. If read_reg is available, could you
take these reads on the 8812AU during a working AP and again during a
silent one, while hostapd is still running? Please include iw dev from
both runs.

        r=/sys/kernel/debug/ieee80211/phyN/rtw88/read_reg
        for reg in '100 4' '420 4' '522 1' '540 4' '550 1' '554 2' \
                   '560 4' '560 4'
        do
                printf '%s\n' "$reg" > "$r" && cat "$r" || break
                sleep 0.1
        done

Use the rtw88 PHY in place of phyN and run this as root. The last two
reads show whether the port 0 beacon timer is still moving.

Best regards,
Luka Gejak
