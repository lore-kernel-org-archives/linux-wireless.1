Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.223.33.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329917;
	b=aUwbYTn8FSpp/N1VyGmhI+8BEeqodSBkapIx1h7pBy3Nc1bwISQTbAntelv9ZxYHs51f
	 AZNRTAFyQund8f6fTj60WpHvA6IA8obdmBS0kqnl48k+ySdf13XqDObeUyUlVqXijBTVE
	 2f4hHTCfiozvypQs5XU5e9zHqL1Z+4ntO118IFPqmgn253Y74r8fp93T7/D17JVDhnESf
	 6doGUtZGtq9Y1hEz3HGBuN+tB0IaSFyB4ZuO0fOf/tiBpSZU3NXN9/WkJo4Cbz8oPNgKp
	 JC5TMYAcZ7NfoNd9iZJ/GgZaZx+COJuuvXa+eBssRSx3Ij1fJvCX2+jv4HayuX2whZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329917;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-PPP-Message-ID:X-PPP-Vhost:X-Originating-IP:
	 X-SpamExperts-Domain:X-SpamExperts-Username:
	 X-SpamExperts-Outgoing-Class:X-SpamExperts-Outgoing-Evidence:
	 X-Recommended-Action:X-Filter-ID:X-Report-Abuse-To:X-Complaints-To;
	bh=G6uJJYsvDRL/4IMCazmRRCucn/j4oJYkkgccUp9OL8c=;
	b=iw/Z7eyg2IL1VS1a1bKgx/ta42DG6ocDzXsRtnVEZUp2H4pkhAa8aTv9HEGXpqM+QMAb
	 FUQh36q+6lWRvrRjooFveZa7Tli2Ik3idOvbmy1MMw45LsObsRYKV6whpjKr1H5JF9lug
	 FjFLQELT72x9FiDBdyMdSxl7qzfzy8y54CMtDhIV75tIcNkSC7Xgmd6MSyP6vIAagJ7ts
	 1QwueTULYYO0S7Wrm8ShUWVG/DtE0FOWJxjjOt2R0pSEVIwE0g3ssKZLZZH2imMtpc+3E
	 ND77sAhpxEkEn1vCjH6imh2uN2/m5eq+3hVOQDSdN2V/d3tZG1zJETQ86PQxu6jJ8dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ellarik.com;
	spf=pass smtp.mailfrom=ellarik.com;
	dkim=pass header.d=ellarik.com header.i=@ellarik.com header.a=rsa-sha256 header.s=default header.b=nD7U2stI;
	arc=none smtp.remote-ip=185.223.33.27
Received: from se19-yh.route25.eu (se19-yh.route25.eu [185.223.33.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C4D606A32A
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 06:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C4D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ellarik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellarik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ellarik.com header.i=@ellarik.com header.a=rsa-sha256 header.s=default header.b=nD7U2stI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellarik.com;
	s=default; t=1795329903;
	bh=G6uJJYsvDRL/4IMCazmRRCucn/j4oJYkkgccUp9OL8c=; h=Subject:From:To;
	b=nD7U2stIbnhDJVifU/WjWfgCUq5eipnmzrYd+xb8dnWSlJ1eeg6/uMLEm22doK2fA
	 meXUVAA0p6KqEoNJBblN3bKtxivhGk6xH6+GEjMY1Oa5knsABqAKupn+bf3vvXnWTM
	 Zfl6cpGsLoyxXXIgjx3K3MeSqNdMBsXrbxqwYb4UFVO6xt74HQ3WWJ0Et0Ezf++ifh
	 LLnRqNyIsbOhINVhvOuvaRkcRO1+DTT5wUAkZ3iI8DfuZ+Z1DLQ7rjXZeFa7e44yBH
	 9wI3mp9QbmVPX7/IdhTdMV1/T5JHfyuN7WutUkBNB9waoWnEZuWJb+Sm2x+Q9cOjzX
	 BY2Lr1FZ5LAwQ==
Message-ID: <ff6a236dd11ef2f2cb00202b4a6856424b93974b.camel@ellarik.com>
Subject: Re: Bug report: Realtek RTL8851BE Wi-Fi does not recover from
 suspend
From: Rik van Westendorp <rik@ellarik.com>
To: Ping-Ke Shih <pkshih@realtek.com>, "linux-wireless@vger.kernel.org"
	 <linux-wireless@vger.kernel.org>
Date: Sun, 22 Nov 2026 13:45:00 +0700
In-Reply-To: <7c49b984f5e24dcbadb391e0acdcda4a@realtek.com>
References: <1dc9a6271147c88c7179d55b469372bdb5c8fdbf.camel@ellarik.com>
	 <7c49b984f5e24dcbadb391e0acdcda4a@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-PPP-Message-ID: 
 <179532990370.266696.6810849148438203240@web-1125.yourhosting.nl>
X-PPP-Vhost: ellarik.com
X-SpamExperts-Domain: out.yourhosting.nl
X-SpamExperts-Username: 92.63.174.241
Authentication-Results: route25.eu; auth=pass smtp.auth=92.63.174.241@out.yourhosting.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.11)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuVOl2mrAIzZKsNPizGF+K3Zo6eQVawti25u
 xrpeQuBQTyu2SmbhJN1U9FKs8X3+Nt08vHb8nbKbJjqE4jpc4fX4H1XfVn4bX3C5WEBxzW8NgMtp
 MfutAwlw4Ht3464xWsLilbHtbFYVmmyNP/jzd7CC/1Co8nyDpMGpKMnWLT/M28QYiTpLCsrpI++d
 V3X+sU8j/cY2oirhNZm7m6wh7Iqz7eibU04JcTWQKv3WukWvpFdY0Xbs0nk5SwOCjjSrH2W5tsip
 JSrP8cFfJBPbeO2YmTmYf9felIf8Q0lvYJANy1im26jqdSLearSSTVIJyNKROUzReCS8EpKh0It9
 L25JS816nuiE0t5pG6MLXGczobFzQXRJqOmlB1LhVJ2z/8zd5jix9e14HK9dUPUW6rQaZqRG+rOO
 yTDVM/SDAeFZbksUSu7l0msnHQ+pnhu95fRQWPlOQmn7Bu2t2cSl3XQv6cTrAfIBtLJVe62uoyOA
 Uj/BNM8813zogpOdGRAGcQsOFszc0Z5LrDe56l/41WpTidoKq2ttC7Gn7os4GVjTOSCv9TR+UxzL
 ZWL8hwGBjhpH9IirPfISkaLRlEnUZkUTshp+lvcy5hFr8VakClsxPZ8yTUE5ABY7lZUQaTevIGHd
 1YoAY1uDvSHNjF5AZKmL4HRKmBMeqhQWs8yPRwKZEAeYUOp7A73HI6oJg7w/VodO81TYfzYF039/
 u6uir+NLEHxPSJmF/UdFXLLGPnSOLNVPGvtbGZA8l4ghZ1axip3tMxCVaZa2i9hdxW3qPEusR8l6
 74wjeGMcQjucLBAYPOqZC4b6C1QtC/rI7+oQw6b6bjT0YLw9qyrrwthAFb2kNBWIjNyMs1fsGQ5M
 8pMX01z1pRXWhjh9fdbl44I0Df1bFSGdp3wQniifzVfCzJZrnXFtc7sBHv+zHUekgwWq4kh7D/+t
 zlDEKURS6x8Lq5HD5P7r9Wd8T8lEGQp7L133/XsUk0zRPurcn/+5FpebrmBj5TTaWIrVEh7nuat0
 ZzsldBcVCmo5QZXczGvPyVZ59dLX6qBpW3U5Ey2lggFy2hrdPH8jgihiCLv/WYBSlj8B9OGgqEKC
 7nm3Plpx0AhD
X-Report-Abuse-To: spam@semaster01.route25.eu
X-Complaints-To: abuse@semaster01.route25.eu


Hi Ping-Ke,

Confirmed: disabling D3cold before suspend fixes the issue.
Wi-Fi comes back after resume with d3cold_allowed=3D0.

One observation: the sysfs setting did not seem to persist across
suspend cycles on my machine - after one successful resume, the next
suspend failed again until I re-applied the echo. I have now automated
it with a systemd sleep hook that writes d3cold_allowed=3D0 in the
"pre" phase before every suspend, and that works reliably.

Thanks a lot for the quick and accurate diagnosis!

Rik

On Sun, 2026-11-22 at 01:37 +0000, Ping-Ke Shih wrote:
> Rik van Westendorp <rik@ellarik.com> wrote:
> > Symptoms and dmesg evidence
> >=20
> > Immediately after resume, the kernel logs (dmesg) show the driver
> > failing to reinitialize the chip:
> >=20
> > rtw89_8851be 0000:01:00.0: failed to write DBI register, addr=3D0xB48
> > rtw89_8851be 0000:01:00.0: failed to write DBI register, addr=3D0xB48
> > rtw89_8851be 0000:01:00.0: failed to read PCI cap, ret=3D134
> > rtw89_8851be 0000:01:00.0: loaded firmware rtw89/rtw8851b_fw.bin
> > rtw89_8851be 0000:01:00.0: xtal si not ready(R): offset=3D41
> > rtw89_8851be 0000:01:00.0: xtal si not ready(W): offset=3D90 val=3D10
> > mask=3D10
> > rtw89_8851be 0000:01:00.0: failed to power on
> > rtw89_8851be 0000:01:00.0: failed to setup chip information
> > rtw89_8851be 0000:01:00.0: probe with driver rtw89_8851be failed
> > with
> > error -110
>=20
> Try to disable d3cold before suspending by below steps:
>=20
> 1. use lspci to find the device address of RTL8851BE.
> 2. disable d3cold via sysfs
> =C2=A0=C2=A0 echo 0 > /sys/bus/pci/devices/<device_address>/d3cold_allowe=
d
>=20
> Ping-Ke

--=20
sent from Ubuntu / Evolution
