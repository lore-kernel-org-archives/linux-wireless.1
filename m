Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.28.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806847;
	b=MsSTvv/WHuogvHYipbwEKDBif5A79e4/nIjyAFuSs5lJG2ngxXKwEbB5IiUsQ2fYVfHR
	 t0NauAOdsBtn0B10gp/J1Is7RNy99esoB5ju3kiab6yh8Ug2n6nmi2fAyYqmMkerkRaJO
	 dOrVyYh1SY6vx03qaRo1Q40RS0+GoNZc6WYsjzlkG0U9K1jCkpdgwWq4jm4fhaayzQRQ2
	 5EnC4nrWMkcJeH3YvT2OQ3iithfpxkKiWWqGyvzXJ3i/FkzFsmPcfLYfaWEmGjbBqM16C
	 vxf5sdvErYu/4cUoLx05h8XZQWrcRut9D7gvy8yqDCusITzgxRcuXSZRFa3D0QxBSPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806847;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:References:In-Reply-To:User-Agent:Content-Type:
	 MIME-Version:Content-Disposition:X-Virus-Scanned;
	bh=fUCiod/Nx4ysiVHAW0v83yh8yjNeK9e+2y8PPBOQYjM=;
	b=TJEXCZKpqTlhlH2hy4Lj7NUb+GMNbrUgoTE6jutZW8FH8zl/5MX8zCX7r7RLkEzEdUo3
	 2+K0kQhzZy7IHE3c9g9GwWedXUFDWYKMu7IycpQzPGiiPPpsZljISUa/DfO+GO9QxOHkZ
	 izA/djth0m8cWDPFq83D3fVApUEBTl23EzXhpyjtCqrz2bLbzJh2wbz1j2aKkBe+D7QAo
	 m8sev5HcoCQucSsLgpIGrLEZ+zCQJ0BR78T8O+Wij6ZUlfTZ5m2lG2Yh6Eac+1OpLNKHy
	 2i/5qgb05WMrZwXgpMnBxjqcHyiCQQGSsjTM/x3gmwK3yMPiGY6WQL95k6Lmu62cpQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfdeck.de;
	spf=pass smtp.mailfrom=rfdeck.de;
	dkim=pass header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=dWtmCIst;
	arc=none smtp.remote-ip=188.40.28.6
Received: from www226.your-server.de (www226.your-server.de [188.40.28.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C151606A31E
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 19:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C151606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=dWtmCIst
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rfdeck.de;
	s=default2609; h=MIME-Version:Content-Type:In-Reply-To:References:Subject:Cc:
	To:From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=fUCiod/Nx4ysiVHAW0v83yh8yjNeK9e+2y8PPBOQYjM=; b=dWtmCI
	stsnQ73OKEyfL9EBKMA2GOIJyZyzE/uu8TfdirFlBTj4R8kqYO0IAmze5lykcCGUgWYydQhVxOSUg
	h9ftLnTxOq12BCyxYTiBQV69+88UjEmrQFLeQnt3z0TbLwXxhylmAiLR/EI90TycqqwguNjlGb3ga
	2EPG38/Ul5xJxUhyXwNweIZfqwNPFjrTX27/aq+g9AVGcN6dATDsjsqcDULIYqqYhUAD5/Zu41g66
	364KNvJpImOcml2sd2YIpuHvahqHw/4AD66Rdhe+Ng6fNKp8aMvHDFhn5vNx2F4gc/t5s21RKSJMW
	2h0BpW0WCNt+ldSkKzA0x3fYO0tA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www226.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <martin@rfdeck.de>)
	id 1xX1OV-00096g-1k;
	Fri, 27 Nov 2026 20:14:03 +0100
Received: from [192.168.0.33] (helo=mail.your-server.de)
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@rfdeck.de>)
	id 1xX1OV-000K9j-0y;
	Fri, 27 Nov 2026 20:14:03 +0100
Date: Fri, 27 Nov 2026 20:14:03 +0100
Message-ID: <20261127201403.Horde.ivCdJn-MZnrp2I8iyRVNzlp@mail.your-server.de>
From: martin@rfdeck.de
To: Luka Gejak <luka.gejak@linux.dev>
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>
Subject: Re: wifi: rtw88: usb: AP sends no beacons after monitor capture on
 the same phy
References: <20261124144427.Horde.qQ_UTCx-6LmjjeS1bojTj8-@mail.your-server.de>
 <D34D5E6B-B159-4F34-92D8-4264024D3319@linux.dev>
 <20261126081256.Horde.ilxldEFeRo6UQJajd_7Nd6S@mail.your-server.de>
 <a0827be820914280cca81b32b495cda655a87fb4@linux.dev>
 <20261126161801.Horde.EPNAvNvUumt6-YVgeu2ZpuH@mail.your-server.de>
 <41ae89e5a8328124062eea53eab2fc49d6114a56@linux.dev>
 <20261126221229.Horde.Dolx0es1tv-1dHtbdt7kG6e@mail.your-server.de>
 <ABB4AE9E-9CB7-459D-AAED-481703358D3B@linux.dev>
 <20261127141540.Horde.j7w80xrIVq5DshPvlKMMIr2@mail.your-server.de>
 <B49A19B4-9C95-49DA-8AC1-A6F4122AFDEF@linux.dev>
In-Reply-To: <B49A19B4-9C95-49DA-8AC1-A6F4122AFDEF@linux.dev>
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

> Perhaps the environment is influencing it as well?

I went back over the sniffer captures of all 66 AP windows on channel
6 (the earlier runs and today's). The low-count windows don't stand
out: other APs' beacons, the number of other BSSIDs, the frame rate
without our own beacons, the retry share and the signal levels are all
within the range of the normal windows, and the busiest windows had
full beacon counts. The few beacons the silent APs did send arrived at
the usual level.

What stands out is the pattern: in the worst case the AP sent nothing
for 9.2 s and 4.5 s, so it stops in blocks rather than sending weakly.
In one run the second AP stayed that way after update_beacon too (2
beacons in 23 s). The sniffer only sees 802.11 on channel 6, so non
Wi-Fi interference or CCA on the 8812AU itself isn't covered.

I'll keep an eye on it.

Thanks,
Martin

