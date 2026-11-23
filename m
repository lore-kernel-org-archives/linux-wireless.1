Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.223.33.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418907;
	b=UAlm0IIVJJ/7KLUVbdt8DIVAJQtyOuA4LQgmgKsNQN9MOAeuIqie2hvNgmL6m6K4YCSE
	 V5C6IsRHmkxa3SX9iV46OcDrI+OTuCTOhp6R5iewNV/b7Swal4fML4lqsjyu+2sHxezcJ
	 gAY9iTJOJuGTmjGPUWRcEG3J+6rODnY+XZVRN+Ynb+wHcusLf4pP2tja+iYCtFmjftrvG
	 OqTlMldGbQN6dR7UelKNjux9otnBtE/f3X62nqODLOoyrIHHyXd/pEdi6Cz8tAZ5f/35f
	 APqXGydOqv6WZNnc3o7hbdZhdjP+0Haw9cL36vYbYmd518fnJfGxBURTH0U25w/CNdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418907;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-PPP-Message-ID:X-PPP-Vhost:X-Originating-IP:
	 X-SpamExperts-Domain:X-SpamExperts-Username:
	 X-SpamExperts-Outgoing-Class:X-SpamExperts-Outgoing-Evidence:
	 X-Recommended-Action:X-Filter-ID:X-Report-Abuse-To:X-Complaints-To;
	bh=31K3HYlnXle6+fyYq+8TBXbzagvVDzlnAnsQfEiTqGA=;
	b=2DaJ2JK0kuJYC+FnoGUrtHqgBoEgI/CT5R8sKNH5Ntkrph3r7/JG6Qkfz1eh+16vyKd3
	 xahwqP4T+lUJx2VEEi5E9qODkT2jtvYLZUU3vPJ3g0g/L2VSPe3+sW1WSLNgqwj/e8Zo4
	 j+RYGRPLcoHI3lkW/JGvpMrLtL85DkZCZ9FojJZtIe8vZ/OgBvS+RfuLQSEK0HVsiYuyI
	 /YsELm7nis5qT1iyX2FzPZVMGPjJsAto5zhybHNw2KxL/NmGgr97bnAKcLRgLE82MrfmU
	 ERi8f5njc5F8es/YddOwjR+dJ/6FweKeinE+1na8D5yAzgSxESC1Tf00iasW9mWHpUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ellarik.com;
	spf=pass smtp.mailfrom=ellarik.com;
	dkim=pass header.d=ellarik.com header.i=@ellarik.com header.a=rsa-sha256 header.s=default header.b=jXPF0R93;
	arc=none smtp.remote-ip=185.223.33.24
Received: from se22-yh.route25.eu (se22-yh.route25.eu [185.223.33.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8338A606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 07:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8338A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ellarik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellarik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ellarik.com header.i=@ellarik.com header.a=rsa-sha256 header.s=default header.b=jXPF0R93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellarik.com;
	s=default; t=1795418894;
	bh=31K3HYlnXle6+fyYq+8TBXbzagvVDzlnAnsQfEiTqGA=; h=Subject:From:To;
	b=jXPF0R93u6JOEYRbBwHk3FvCquABbLYZ9GGBWfcQoQuzB/JTNAvuk3MclVRbW06ag
	 jhqrYo18J5RGHvHiArSBDNo7e+ZDsGP9ENkJiNAdlIs2FMM2TDPk3eJXjrGZomCMn6
	 f6q9ALqVUMV9onOVXVIWs7AcjgRGMm25oggzadyA7fDSkVxrNKo9jAirMO3DHmMnSi
	 qeeaD/aHzV3I77oCvDShgXrFmATvJE1O2V/pwLVnn+9RPAe9QL3VVtcc6MEhO/gjQL
	 I7WLDaf4+6HVzLRP2k6M28L5vQaHKyYMJjFXDGoL+qt7NpmjT5Pko+Z70cwnVEJWlr
	 MOiKcbas6Uk2g==
Message-ID: <7e47e43141ace3e769a30653b84228444e8235aa.camel@ellarik.com>
Subject: Re: Bug report: Realtek RTL8851BE Wi-Fi does not recover from
 suspend
From: Rik van Westendorp <rik@ellarik.com>
To: Ping-Ke Shih <pkshih@realtek.com>, "linux-wireless@vger.kernel.org"
	 <linux-wireless@vger.kernel.org>
Date: Mon, 23 Nov 2026 14:28:09 +0700
In-Reply-To: <c873b08ae23a4e56884aa6139d5d8b6d@realtek.com>
References: <1dc9a6271147c88c7179d55b469372bdb5c8fdbf.camel@ellarik.com>
		 <7c49b984f5e24dcbadb391e0acdcda4a@realtek.com>
	 <ff6a236dd11ef2f2cb00202b4a6856424b93974b.camel@ellarik.com>
	 <c873b08ae23a4e56884aa6139d5d8b6d@realtek.com>
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
 <179541889397.2202700.9978723447245522164@web-1125.yourhosting.nl>
X-PPP-Vhost: ellarik.com
X-SpamExperts-Domain: out.yourhosting.nl
X-SpamExperts-Username: 92.63.174.241
Authentication-Results: route25.eu; auth=pass smtp.auth=92.63.174.241@out.yourhosting.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.07)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuXUnHBx095/t0x5sXkwDpgJwfrC/bJMn/bO
 y1T8LijPryu2SmbhJN1U9FKs8X3+Nt08vHb8nbKbJjqE4jpc4fX4H1XfVn4bX3C5WEBxzW8NgNA1
 7ZVkl74/VpUYGAb5rrTilbHtbFYVmmyNP/jzd7CC/1Co8nyDpMGpKMnWLT/M28QYiTpLCsrpI++d
 V3X+sU8j/cY2oirhNZm7m6wh7Iqz7eibU04JcTWQKv3WukWvpId7B1GRNEYY1qZgjsaKY4y5tsip
 JSrP8cFfJBPbeO2YmTmYf9felIf8Q0lvYJANy1im26jqdSLearSSTVIJyNKROUzReCS8EpKh0It9
 L25JS816nuiE0t5pG6MLXGczobFzQXRJqOmlB1LhVJ2z/8zd5jix9e14HK9dUPUW6rQaZqRG+rOO
 yTDVM/SDAeFZbksUSu7l0msnHQ+pnhu95fRQWPlOQmn7Bu2t2cSl3XQv6cTrAfIBtLJVe62uoyOA
 Uj/BNM8813zogpOdGRAGcQsOFszc0Z5LrDe56l/41WpTidoKq2ttC7Gn7os4GVjTOSCv9TR+UxzL
 ZWL8hwGBjhpH9IirPfISkaLRlEnUZkUTshp+lvcy5hFr8VakClsxPZ8yTUE5ABY7lZUQaTevIGEs
 QB4/w5cFrNMxnKP28WyWoIR1E0eGyU1MJxP5mblDhweYUOp7A73HI6oJg7w/VodO81TYfzYF039/
 u6uir+NLEHxPSJmF/UdFXLLGPnSOLNVPGvtbGZA8l4ghZ1axip3tMxCVaZa2i9hdxW3qPEusR8l6
 74wjeGMcQjucLBAYPOqZC4b6C1QtC/rI7+oQw6b6bjT0YLw9qyrrwthAFb2kP63Y61+ilqk6LovI
 Hih3r1z1pRXWhjh9fdbl44I0Df1bFSGdp3wQniifzVfCzJZrnXFtc7sBHv+zHUekgwWq4kh7D/+t
 zlDEKURS6x8Lq5HD5P7r9Wd8T8lEGQp7L133/XsUk0zRPurcn/+5FpebrmBj5TTaWIrVEh7nuat0
 ZzsldBcVCmo5QZXczGvPyVZ59dLX6qBpW3U5Ey2lggFy2hrdPH8jgihiCLv/WYBSlj8B9OGgqEKC
 7nm3Plpx0AhD
X-Report-Abuse-To: spam@semaster01.route25.eu
X-Complaints-To: abuse@semaster01.route25.eu

Hi Ping-Ke,

Here is the information:

baseboard manufacturer: ASUSTeK COMPUTER INC.
baseboard product-name:  X1404MA
system product-name:     Vivobook 14 X1404MA
system version:          1.0

lspci -nn for the card:
01:00.0 Network controller [0280]: Realtek Semiconductor Co., Ltd.
RTL8851BE PCIe 802.11ax Wireless Network Controller [10ec:b85b]
        (subsystem: Foxconn International, Inc. Device [105b:e100])

Let me know if you need anything else. Happy to test a patched
driver if useful.

Rik

On Mon, 2026-11-23 at 00:45 +0000, Ping-Ke Shih wrote:
> Rik van Westendorp <rik@ellarik.com> wrote:
> > Hi Ping-Ke,
> >=20
> > Confirmed: disabling D3cold before suspend fixes the issue.
> > Wi-Fi comes back after resume with d3cold_allowed=3D0.
> >=20
> > One observation: the sysfs setting did not seem to persist across
> > suspend cycles on my machine - after one successful resume, the
> > next
> > suspend failed again until I re-applied the echo. I have now
> > automated
> > it with a systemd sleep hook that writes d3cold_allowed=3D0 in the
> > "pre" phase before every suspend, and that works reliably.
>=20
> Can you help to use 'dmidecode' to find the board name and fill an
> entry like [1]? With the entry, the setting can be persistent.=20
>=20
> [1]
> https://github.com/pkshih/rtw/blob/rtw-next/drivers/net/wireless/realtek/=
rtw89/pci.c#L4774
>=20
>=20
>=20

--=20
sent from Ubuntu / Evolution
