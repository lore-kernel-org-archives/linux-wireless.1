Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794205420;
	b=Yl/FauUk1lAEFkCrYdWszKCZrA+GoIBozZAy5/JJtNyEEd86mHqMmJ4haKWUgugNO8PS
	 dIyb7qBC0zibtcWYIEvh52WHTGVvVnjEfTd8+JCIPhnoG0OAgsA6a5kUHbufW6dW/r803
	 y25YASgCLx7A7Zi5ysvfwxkVqiiJ6b3lCCjLWMuNGzrHM2nAXHclnbfgJF6YpphFp8ii2
	 /UzFzYU+OU1tDE5VD3HDi7OWJr9Wz8KvPMNzmTpcvL1bZAP3Yavb4PkZBukdtgFsidWI/
	 8ApaJF+KznaKnfA4EdqJYIFcnIoH+FfbwCrb3NC1TxeHTGgxh9JsNsjqXbJIeJhnHXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=DBx7ARYAyYFxHh9VB63NxxyFYZBF08ZfROgGSc1BSLg=;
	b=SRlSfW7OOD3Kkihosop0puMRvCXHim1TiEP+PghhCw6ClB1fCNkoZ0taBU9eZATYwCHI
	 AOupdi1XfULMFpgjBAKs8KkEwxb11TuRrIPnNJnKSIA4xS72Yrg0+YxyLTvbCCdyQWyPl
	 jCP0ZTbyt4sjzBSnSNIMwfs5yaYWqMLp/oCosM28DK/nqcGIhwRCVGcXUE0KSKHo/pD5k
	 zb0mOXxRQJCbqcaT3W5U48qQYF5sEZLzYnJD+AC7PGhuc99oMs6loNRncjL1WPQLbg97i
	 c9uHsWzwKJaN43AJxnTFIfwPSyKx8mxsAtPD2ZQNCneXCVueDfLfTQ58UMjyD3c8X4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtwAzeIa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD70606A31C
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 06:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD70606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtwAzeIa
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-716d052dc23so179266eaf.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 22:23:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794205419; cv=none;
        d=google.com; s=arc-20260327;
        b=j0GT7q5W6BbY+JrsmV01UQ1yzdAOIRGdXTLCEN4ZJ4zgDU/nziJunqCuWK8E0hLt8Z
         2m2dft0JCELq2FXYAgwaPw5iwwwmNf8WfpHhUE8fbEFM7lOnYM1KbznF2rs36XnBgolr
         t1ZEahKtBJdRwwxOxhACNjA4/rCJiCrjFdsxeT0hB+dy2ctqBqmlFgEr+giBdUW9YhAm
         ff5nfuOjeoG3rzXSAojiecHH9uB6+pY5lmbsAxydmNqCQd0bRP97x9OU4ub0f60ehrL2
         TLQ8QEMawKjZ+YLypB8XnH/ocAJKso6EccEG678T3TW3Zcxf20TfdlgwHmpw7xWhAwGD
         CoUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DBx7ARYAyYFxHh9VB63NxxyFYZBF08ZfROgGSc1BSLg=;
        fh=IqAc6tL29HKpcv4mM5ihUQFVRPmRrQd7CE0Pcb4uWbo=;
        b=rGRhl7DcYukU5vk+vqAdJEQanGPZuOxs3jc1mJmrM3DgrfAQ/XYedfsTOsSWtfxri/
         nYR4f5kXFuS7zzzOcpRRWxHAUaR1F/gJrjfCSetdFJ2BUgbF3/Vs+wsUNN9HlA55M72h
         ROX9iQYj0VV89XXquj22KhaDNbAWf0HY1Q5NHOy8KmXpK+I0OvPTIJnDrDRa4I9NHuOZ
         tavFzGo/QHgAnpkNAWv7VPY7Ti9xkjpWABoXwLX3z18znb2IpfWikNNvcKO8C9U7Ra06
         HiZI0i6eAS+5gWVgzaHsxXXoT68JkHCogJJ9+IjcmpcIQUiKFtzH/pnKtwPiwblw98wk
         dfYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794205419; x=1794810219; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DBx7ARYAyYFxHh9VB63NxxyFYZBF08ZfROgGSc1BSLg=;
        b=qtwAzeIaVqGzIb4/CuWrm/PINDFF64FxjqXi7XTyH5sHC2sMjafU85HgJon78/QfvC
         k3JNGMOnrHFGxTsgfh1pQfZbjnqxMJYdx/HwkNC/XxbwyE0nZkSSxwW7hpddARmrTqkS
         h41L7BGip5bpyAu9XpV4pFkGYtaMSJmQrGVrqe8+Cm6F+YEvz9SFBqgyeG+0CpamPSpn
         dgVex9YjIBRGmkCpxcrEzUX6/lrAC0vWCDAId3j3NUxqT5SJkG8H32NyJhDrjIj5PKNp
         b0yLnLuYqY4r7vqEGUG/U3S1t1Ycl6rfUqTg5anZgY5hWZRSEM+qySRaHtW76DJtVoqL
         bnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794205419; x=1794810219;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DBx7ARYAyYFxHh9VB63NxxyFYZBF08ZfROgGSc1BSLg=;
        b=YhKKUJZ6OA7kWdqEv+qpAQGt7GeoOqsu67W3ha0CK7FzqgZeWDa4g/rNzB1RtZzR3o
         L0HTmhTsjK0JUDE7AOPRIiZH4SgfUqtFBZOeHpGkKqLuwV3++xCdF+UNo/xqhGy2BwjV
         0+LD/ViEP8M/jJxzmKkJzN5jQmtZn2nA1z7oDLNl5mDDlwBREaM4i9B0H+nmV3YJ7oMa
         xdpI/HAo3IKFIga+DBl0589F5rRuGdWNFoa/Jx6znY+UKdf42abXubrVDeD8O06uLY7f
         hzt7m34ZGOgaI6bOh/jaB3B0hPYt3a8SnkeekUsfqS8x3QyAc/8jZi99qwzKC4f99Ek9
         9S+A==
X-Forwarded-Encrypted: i=1; AL+hErGaJecHCpbOFmGEZBEEb7aIMP3FT+tWOb6syOM8pbt4KszXP6H09kxatKQimXGDthY6dm0/tETOoMKt4PNXDw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+GEL9GeQzZt4pnCZb2qk1UAEBP44IvqjDddbAd6YWt477cOgk1
	dMt1/uS20o7N87dXvBh5rmo3zCzvJzs/FU1/Lb1XIppYTXytlGj6smf3WJ3yB0C+uZK/zO8TABj
	NnjmwRQ0poNARHF9NbKOw7hEVvLzF6wY=
X-Gm-Gg: AYBFou08SwqX5tgP3wcW4wZDPHwiSHi91wcC2FkS/wKT0utRBcJRRQVScylyay8BYjX
	aucTzmkgw+RnGMy7idQj1F6eXs7FpCX4EdiZYaZXxE5O3yYSLaPr++QKeCL5fNWIrZHCetkxQOv
	bB52ByOSTy5/6XStIAv3peAzrOQLFsupgLZXZXozziJY/a5WLhJRAvs4psilyytuB9Onprggs+1
	gieLpxDhlHmUCXUBsUTuVbK+kbH+cuzxTc2d7Y67k1CGixG6w2+Sk81hF5UGvYhVWhymNXpuZNQ
	37x01lWGW7Wt2iQUYGyUb5TgG56kx0oBCPDExsGaRE/PIZEmpH7gnyV5+cXbnMuUeNKhMIiulXN
	FkYGk7U/Hd8PqOf/vQR1LL8OOXp0xdGeAX9U8
X-Received: by 2002:a05:6808:1484:b0:4fa:8d48:3a6a with SMTP id
 5614622812f47-568144302bbmr2496151b6e.18.1794205419442; Sun, 08 Nov 2026
 22:23:39 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-b4-rtl8xxxu-usb-buf-v1-1-ed021a85a2b9@gmail.com>
 <72fc9599-3f63-4da9-bc18-aeb09d0f757f@gmail.com> <0bf816c620d74dd7ac4bebdc2b466c6d@realtek.com>
In-Reply-To: <0bf816c620d74dd7ac4bebdc2b466c6d@realtek.com>
From: =?UTF-8?B?4LmA4LiX4Lie4Lik4LiX4LiY4Li04LmMIOC4o+C4seC4geC4qeC5jOC4luC4suC4p+C4o+C4pw==?=
	=?UTF-8?B?4LiH4Lio4LmM?= <lnwgorou@gmail.com>
Date: Mon, 9 Nov 2026 13:23:28 +0700
X-Gm-Features: AclHuK8swnWbDuTRWDTvJ_-bo7Iluv9Vktpugh5FOIcmp7oeAYWuTst-O5mxKgQ
Message-ID: <CAOOX3_kZVv3OGx5-ktOyDXsRzrfFFAskgxsaQL3r8pMad3Obqg@mail.gmail.com>
Subject: Re: [PATCH rtw-next] wifi: rtl8xxxu: Allocate the USB control buffer separately
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>, Jes Sorensen <Jes.Sorensen@gmail.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

>
>
>
> For the record:
>
> https://patch.msgid.link/20261010-rtl8xxxu-usb-dma-v1-1-e670d9c08fdf@khu.ac.kr
>
>

Thanks, Bitterblue and Ping-Ke, and sorry for the noise.

I missed Kim Wooseok's patch, which fixes the same problem the same
way, and I based mine on an old tree by mistake. Please drop this one.

For what it's worth, my measurements on a Raspberry Pi 2 independently
confirm the cause. With a sentinel written to the buffer before each
read, 72 of 193 reads that saw mutex contention returned stale data
with the buffer next to the mutex. None did with the buffer in its own
cache line (0 of 214) or allocated separately (0 of 270).

Tapparit
