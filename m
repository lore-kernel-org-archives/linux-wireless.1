Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621118;
	b=UYjWBZd+j0HpYSRMSuGtbL1aM8Hi1d7r+oQzall1sjVy+0l101kuj67M9c4EG/byYYYa
	 Mherfo9NUU3DAxrjDPFO7ac1LibMzOgiF5VHD3YRRFZZv+y/WozFxK8rSBh9isB0zIqe3
	 FICppuGWYAG//jy//X82W8DniYHxCZufHzoqbfCZt7dLYed8IY1Bap9UebQOOcsuh0Ztk
	 5KeM5GtiTaOcls5vXpCZC5chfLEJ6zc6ng1GVeuajaPCFBdyNyILDgAmfmrSmp6+bjaBO
	 HzSc7kNTKIPI+C4JL7Lf2Mv2Lg0D5mi74VrG1Dn4xs3zTCQaS5sH5XD6guXbt2XxicQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621118;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ogNlzscz5JsQBqSb37/QTn5pubsd+/zkBfoNLnJ/mj8=;
	b=hGkQqNZITAd7Zbt01yPCJo/UncxsrPSQU6ZcxVfJEKdlBAp6ZLQObfSYIollHJzG0aMP
	 YrxtTpxhcAywCKHXB5uXrTyhbz5nPRQ0DBPYh4nPLCgj9KEHtVd/y7thfsqjrdS37SM3E
	 YOYUOjUN6ka1TVGN2vjOPPJfbV/+cVbyeGRyWLirJjp2kmfoaCbLjB/53Gly0oYPQQtPh
	 /vez6DNWBRrr2hx8kCebI61hTLjkUmBEFl+urdvU640FYuCJsEDAZjLhAO7cshqyLaSUx
	 /xk0PAYLcdTCsrQjvT+p0f7sWfCkG0wNIOHX6SXI/HuvlmVWfIYZGGp60h7hM6qc2sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=azqU1qWe;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971FC606A327;
	Wed, 25 Nov 2026 15:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 971FC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=azqU1qWe
Date: Wed, 25 Nov 2026 16:38:32 +0100
X-Lima-ML-UUID: 02bc04c1-088b-464b-99b9-f7569b8c9e43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795621115;
	bh=ogNlzscz5JsQBqSb37/QTn5pubsd+/zkBfoNLnJ/mj8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=azqU1qWesEGsBy28EBEl3FasGAyri5mBVbXOar6e2rMKYPn28km+psqb4Z+BtIzZt
	 71csrNqq4wLFgGBYE5NF+XV8ynRAyYR8hwPbhbtDyMYMwErAJ4bidQE5OO5zocqfsw
	 EElKIJDwWBhsau/+VOOZau4OPRQ/dfodqkYPHjt0VOlp1BNrEsFV9EYtNDJJd/BZYi
	 DJyZSJdf9jvCg4NqOWbPQ3dHH244e7dwI6tZxnaWACqWXeEw5wBm274dx/LZcGAtiH
	 7f385X+iPkh6GO6yWJpPlvu4cG0pU0OeSEB/+9xUo5lYsr0jMq2ij1kvZPDG+a6Ss/
	 sotwesUcqibYA==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, Yossef
 Osman <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 4/7] wifi: brcmfmac: create and remove the AWDL
 interface
Message-ID: <20261125163832.10875ea8@kait2en-mbp15-1>
In-Reply-To: <20261122200931.2090372-4-arend.vanspriel@broadcom.com>
References: <20261104151547.70333-5-dev@deq.rocks>
	<20261122200931.2090372-4-arend.vanspriel@broadcom.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
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
Content-Transfer-Encoding: quoted-printable

On Sun, 22 Nov 2026 21:09:29 +0100
Arend van Spriel <arend.vanspriel@broadcom.com> wrote:

> brcmf_inetaddr_changed() finds the interface by its net_device, so an
> IPv4 address on the AWDL interface reaches the ARP offload code. With
> arp_version 1 that code uses the primary interface and adds the AWDL
> address to its arp_hostip table, so the firmware answers ARP for the
> AWDL address on the station interface. Skip ifp->awdl in
> brcmf_inetaddr_changed().

Hi Arend,=20

yes, v2 will skip the AWDL interface there. Thanks

> It looks like this is the/another reason for the arpoe/ndoe patch [1]
> sent. At least for the ARP disabling part.

I think that is unrelated. The two reports predate the AWDL series, and
they come from the t2linux kernels, which didn't use the patch. The same
goes for Bla=C5=BE's BCM4355. The drop itself comes from ND offload, with
only ndoe off the downloads are back to full rate. ARP should stay off
for the reasons in the v3 commit message.

The other points of the review go into v2 as well.

Thanks,
Andr=C3=A9
