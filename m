Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435721;
	b=xYAHXMOyqI9nY6tfPxDmonIM0y7lOQD93UAAY554xBDaO90xLwXEgWTlm7T5xs9IcZnq
	 Uu0I3CWqBHOmvG5LZQnXdUeC3pHUU3KMP82+KPptUESJ/tcmFLjIRDxC+bwRlX/Ys0zo0
	 YjkwtFfPhVJAyxr1bE4bMVSiVxml/3oQ7vnwgrmBI+Ll9A4siqWRnzDm8jBuBZgW9Nvq9
	 pbCZOcaGQw6mjEH9xugKtIDp+9durYRlYeCzsnvgtStxV7zzW1KDRg5+Pk9G92r7cELxg
	 PNMaLk8RULYl4cXMIxLjLQe+y1vG+W0+d96G/A1xlXjH+qgi/dQ5N3uEVyTM234Khgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435721;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=37RP2//ETdXvis/FKEopE5VBwAcSJOzA2N8HY3jTRV0=;
	b=VTOljmAljV73S0EiqKrwYVbVPHuF52KQiLTu0BbeHZ1VXdvd6jinZJ2ybq6HDvWhP1mg
	 YBWujf0f/qA2xSZ+c+5xQlUwTC5nv+9ULNv0h3eK/g5iDAbQJFHe1gr1rpoVdEkERxdG2
	 4Xv7ktcfVqsSjDa+0ywyruHJTkhDAeZsr3iRrWa7wfBl8tLacj/0dBdnE4PHqyk83h4qc
	 aVp/m0w8CVwgLq/tqdWSDgLoGjYPa/TJ9ukSGi5rGCRb46YxIzuYmJ0VRk1ze1foVfPNG
	 P3hyOWwjzPPWPRvfMQefgqtuhKE0JESQRhlFmUgzlcnZW7k/ugXsRJNoqZK4Am77RmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zFM5ca0r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4790C606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zFM5ca0r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CA61F000C0;
	Mon, 23 Nov 2026 12:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795435720;
	bh=37RP2//ETdXvis/FKEopE5VBwAcSJOzA2N8HY3jTRV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zFM5ca0rlStRsg4egxfUVLuOV8p4eUNrF2VQ3j3zO6P0VbpURGqbXk1USQLD9nTTl
	 eondpKYNdGYopYhUATSko0ng4eGfwTz56J4x2NssIz6ZJYQmzWK+gsvKkJadsdtB6x
	 fm75L4ccCGVte03mFuCaulCsXyUslC0ypYK6h3wo=
Date: Mon, 23 Nov 2026 13:09:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanuj Sharma <ertanuj96@gmail.com>
Cc: security@kernel.org, pkshih@realtek.com, kvalo@kernel.org,
	phhuang@realtek.com, gary.chang@realtek.com,
	linux-wireless@vger.kernel.org
Subject: Re: [SECURITY] wifi: rtw89: OOB read in beacon/probe-resp IE parsing
 (OTA, pre-auth)
Message-ID: <2026112334-undermost-sizable-be65@gregkh>
References: <20261123101028.58146-1-ertanuj96@gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123101028.58146-1-ertanuj96@gmail.com>

On Mon, Nov 23, 2026 at 03:40:21PM +0530, Tanuj Sharma wrote:
> Proposed patch
> --------------
> Replace `skb->len` with the actual IE region length, with a guard
> against underflow from malformed/truncated skbs:

Please send this in a way it can be applied.

> I have not shared this finding publicly. Happy to work with the WiFi
> maintainers on the patch if any changes are needed.

You sent this to a public list.

