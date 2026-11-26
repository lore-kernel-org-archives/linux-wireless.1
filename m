Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.28.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677186;
	b=FtQTozRrg7lk1ritC59gKZ0O9PzTalB0HpSlji++WUT8dWWssUFtjTZrHLQAWnHKQw4O
	 jEu80MjaXrWka8c4hbKm7tpRhJGoxYuIF3wdmemk/ZoXtlXSxPhvcdrogDU0RaV8KuQ2i
	 hZLW/imta5SYPkNkFpDq+9udETh+VtHJYrMYj+Z8mv8tQjIVZyUhGy6yB2gAXYHj7AY/S
	 TOr7JW2y3X0JWAyH2TfPeTb070tN72UKyb41crQyVr1SuAI4+ndmZmAuuiGD09pllZOfb
	 lckVHyc4TG5jdx3doTvPdxC481YIXcjk11qxxsayVWatIDprrdL7uaosHu7UXZiURuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677186;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:References:In-Reply-To:User-Agent:Content-Type:
	 MIME-Version:Content-Disposition:X-Virus-Scanned;
	bh=8FtkSiXbJIm5j63T3xqM1B1Jy4CU0RpZ541iCCiUDqw=;
	b=D/6hh+rsr4WAwU+s5pEAKXdyFt4jzzYsodmMiI24A6Y9/oRXde0vpE7XAu4sch5qHZDJ
	 Xqy34BI6RXDL0C+ontatxA2HsxeZ60P7Qs+anuI2RO7NeqbyU5mkayop7AnJkcaKf+mde
	 LekIYGuw0GexTmBqk2cWSZKkyVGYwP59v0CjefRyDDp7fikJnJ5k6piS5LAyctoAcecAm
	 jTHLjbcs/YuXeez/jEHPPj1z/ZYNwv6xjUCMqmvg+i2DWrBNfTpKzrtaeurwY/ek53Ko5
	 7u0NOelg/BRj9zXNyaALp1F+j5wTGixBuCBh5kiSlk3VYEkr/EZNc+kGyV8OXDYdfRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfdeck.de;
	spf=pass smtp.mailfrom=rfdeck.de;
	dkim=pass header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b="eX3vb9/K";
	arc=none smtp.remote-ip=188.40.28.6
Received: from www226.your-server.de (www226.your-server.de [188.40.28.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3B5606A31E
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 07:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B3B5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=eX3vb9/K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rfdeck.de;
	s=default2609; h=MIME-Version:Content-Type:In-Reply-To:References:Subject:Cc:
	To:From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=8FtkSiXbJIm5j63T3xqM1B1Jy4CU0RpZ541iCCiUDqw=; b=eX3vb9
	/KHTW5RiR1+9MLNz4uCymRIlcwIOYyceHCmJ89f2a8GiDl7XZ96lUOc25ybQCKNSvVfkkVVzx9S71
	z/4b0Z30y3HBpzCQdOThPew21ew0ykpqZ8sEmgRaA5jBmfCxekJYnbtuLa4MTLK5FDL/Znb0r5b3O
	3B4kDZ08W0gHdpDQcPbs4iEjUC9mm3GsPXxfSh9nxMokC9zsxWdo0Ao6VLCxhYYMMjaMMlDEQwrmo
	12Bi9NllDnCgXifwCz5jIIVAWtbY7BSkbNL1U/mYy/Hzy6g54iZBEDndo4egfFIuvJmIRWbPXihW9
	yijB0TXph7xFp3sstt9HdakND1Tw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www226.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <martin@rfdeck.de>)
	id 1xWTf6-000Gtc-25;
	Thu, 26 Nov 2026 08:12:56 +0100
Received: from [192.168.0.30] (helo=mail.your-server.de)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@rfdeck.de>)
	id 1xWTf6-000PQZ-2z;
	Thu, 26 Nov 2026 08:12:56 +0100
Date: Thu, 26 Nov 2026 08:12:56 +0100
Message-ID: <20261126081256.Horde.ilxldEFeRo6UQJajd_7Nd6S@mail.your-server.de>
From: martin@rfdeck.de
To: Luka Gejak <luka.gejak@linux.dev>
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>,
 martin@rfdeck.de
Subject: Re: wifi: rtw88: usb: AP sends no beacons after monitor capture on
 the same phy
References: <20261124144427.Horde.qQ_UTCx-6LmjjeS1bojTj8-@mail.your-server.de>
 <D34D5E6B-B159-4F34-92D8-4264024D3319@linux.dev>
In-Reply-To: <D34D5E6B-B159-4F34-92D8-4264024D3319@linux.dev>
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
X-Virus-Scanned: Clear (ClamAV 1.4.6/28194/Wed Nov 25 07:26:59 2026)

Hi Luka,

thanks for looking into this. Both tests are done, on the same box
(7.0.0-43, RTL8812AU fw 52.14.0, channel 6, 12 s AP, driver reloaded
before each run).

> Is the monitor still UP in ip link after Kismet exits?

Yes. After all 12 capture sessions the monitor vif was still UP
(operstate unknown, on the last hop channel, e.g. 40 at 80 MHz), and
the base interface was down. Kismet's capture brings the monitor up
and never takes it down or deletes it on exit.

> could you repeat the same sequence with the monitor brought down
> after each capture, but left in place?

That makes the difference, three runs each (beacons AP1 / AP2):

   A, monitor left UP:       116/0, 116/0, 115/0
   B, monitor set down after
      each capture (kept):   109/109, 109/109, 109/109

hostapd reported AP-ENABLED every time. In B both the monitor vif and
the base interface were down before each hostapd start.

> could you take these reads on the 8812AU during a working AP and
> again during a silent one, while hostapd is still running?

Read 5 s after hostapd started. All 12 APs, sending or silent, gave
the same values:

   0x100=0x000306ff 0x420=0xff711f00 0x522=0x00 0x540=0x80006404
   0x550=0x18 0x554=0x0064

Only the TSF differs. It moves in every case (the two reads are about
130 ms apart and the TSF moves by about that much), but:

   A, AP1 (sends):    0x016c8d9b -> 0x016e91b8   (~23.9 s)
   A, AP2 (silent):   0x038de301 -> 0x038fe5f4   (~59.7 s)
   B, AP1 and AP2:    0x0052e0eb -> 0x0054e312   (~5.4 s)

The other runs look the same. In B the TSF starts again at about 5 s
with every AP, in A it keeps counting from the driver load, so the
device is never stopped between the two APs while the monitor stays
up. AP1 in A also runs on a device that had been running for the
capture session before, and it still sends; it's the second AP vif on
the same running device that stays silent.

iw dev during the APs shows the monitor vif and the AP vif (channel 6,
20 MHz) on the phy, in A and B alike apart from the monitor's state.

I can try other registers, the same thing without Kismet (monitor
left up, hostapd started, stopped and started again), or a patch.

Thanks,
Martin


