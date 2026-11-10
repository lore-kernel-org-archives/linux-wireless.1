Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794317663;
	b=GfKFDgIAs6z4811IpfqnsziSCPDBISwIwtYU+1v/U1ciOgGxlRENh+NMczEfDQUYBuwG
	 NUrwjlw5dao0pJz9X469qd6X5QjGrPqmerolEwgf9AAuXcgrMNwk3hubvxepaDoSMpob9
	 IcbP5v3reRgdX57f6m84FcKPadEZSzs0riUWy3EDZZjyEVrRF3fSyZrvkCUdKvhQ+EFru
	 Hl+LB+vQjKpUdACscrRyAxYhWKuqU1Hvlm2MHUARFxZqcGtdPk1nypKWDMOocHNzWBlLK
	 GFydjqb1DuBx29PHv8nAh7WIvUgQjPZ8FTFaDIzZ9SGko3x9ZDCXxzWffheU9ad3SeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=n6kTqyqqqPdwcSn13Ge9HAqSD/oKoQ96hB1Zawf5LxM=;
	b=upTqg/mZiL6jxUz4ppTcfT4O/2xZRCc1sbe0LNXFYltaXVG2tKdzqwF+CaEKRe7kjGks
	 2NPlvtIP4/CJlHwKkW5A4e2lJZeMSPLwfG0KFiYImq5m0vzEY32J287394/vGFFjdMwK+
	 yeElhJvFcaXBWu/1F9a9CzJM1gtiiApVqlNLGpBHZY51MWdu9GzVJwIND/fGoOJDQFnUo
	 cpGa3X6V2wRjyBdZVQFnEfLNmiMG5ux7+wop6Squn0OE4VM9gPqMSPbe1C/SQDGT3b+9C
	 R3c6PZClARPt458aus/v0oWz47uDq1Muki3tG+p5wssiC/PEUckXckKbJwt87AaBm5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6Wawnl5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD017606A7DA
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 13:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD017606A7DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6Wawnl5
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so2436939d50.2
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 05:34:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794317662; cv=none;
        d=google.com; s=arc-20260327;
        b=Whz9abV8+3IgillwSW499cu5wpS9UE68lq8WJoinP8CZOSyoi5Ig64/4ecG5v9/2dD
         fNIVaHPLIqFQe3jP7YwKE7tJLomf7Fryvn5laosxRUKXE1q/kILA8fqd0iL3Ij7iG/Iv
         qs+yXK7EpadYbUXQTIoM97DZ5c2CwPZpww3i5nGsCkKBq2ImgrS+Fz7eVLmLRbzu0vk4
         KAP+QAgIFXbe86puh+FPvXxn5jRCvz5mWPHrB9EUqLMs4vIMq4lsVVFlf26RR+ux6qZe
         Sy/fK/4tjqSdMUG+QMqeQMMXbuKYeZpfIgAGgV8n1RA/mnjuDUkz+5JfHlSmtWMpW2jK
         zaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n6kTqyqqqPdwcSn13Ge9HAqSD/oKoQ96hB1Zawf5LxM=;
        fh=Gb8RSDLQoV+qgJjwh3JErt+C3hloosFkdHxORzYl2ZY=;
        b=mRyk7wwqtse5kFXlleZB9FbV9eA41/7+vdb5K3f04m9WaaljEtiXwbWAnAOVUUk8Mz
         E2SjVuzEbaCjHcN79sB2j7lm2e+yPJvjtkxPxw8sfOV9JqVQCf+TuceMcZL6obhi+kRf
         g752WDskQy8ubE31gbDZl3e08D7V6mOcl613JY5k4WcVGrco0sIHDtggUvcpcMF4yWaI
         L4bF3/WM+lh2tQrhUajFaytsoktGYDROm130+Ip39ng/hA0EV+OHk1bZyj0Z7czVTUi5
         L3n3w7oDCJzoAg7fat0GdgUl36Pv1B1YP60yVZkYLZDGeYl6wwXyivJO515/2B4E0EKw
         w1aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794317662; x=1794922462; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6kTqyqqqPdwcSn13Ge9HAqSD/oKoQ96hB1Zawf5LxM=;
        b=y6Wawnl5jOjTZ/inPJh8cE9F6wAkjlEkHFK/IbXXxDEALVBZxbZNuaOq9xjCLNxEew
         eAeopzOCFNIXQNfBhxDX2/roOSszvqUE5wGy3Zq4szON1y53Olfh6PLmoAgaTPBf1quV
         Q+gzgmKyAxml71w7RkwRnJZtsTxTS0w9unKtHG3hvZ/bObkewI6M+kyyHE9XcKzEToJ1
         dRdMctAgcToPuhrL43EC0QaHaGq5JN6xgrNpf9SYtd4AoY3GG6iuR42YfwCdUQvGmsf6
         pWoRWIffA9Oo41xfV6Ml3xWkvQexTDAN7BFcogsTb9B4dgZYpJtzQA15xZHokHq8nbp5
         H9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317662; x=1794922462;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n6kTqyqqqPdwcSn13Ge9HAqSD/oKoQ96hB1Zawf5LxM=;
        b=QcivnfQVf/z+sY93QVxfzus2TYgbRM5oVxDnYD7SlxCnnHmSvs/s6eWlhaHCeJqFwF
         ZH2KdkgmdHuX6vQJiccl6hg0Q3TFrxtC7WQjHJUr7KiV7kbHVskH3b9PtEWwpqwHpPvd
         scAtbtjW2qfEgCVu5AXDzowPQqbULwKg/9yNkDjcof9FCHuwWybjxAk7ID/3pTHtclyg
         GaySoQFMYNokn27+EEStHXDAl/9rqgtO1f95jA/Z9m79ZqxaOfvuDlLgPDZEBTbmSjiV
         bLtsVRmTpZHYkhB9QFJDOeTjaMnjCOnAFTQy90UrEfnEd92hemk6sZGOkLjLen3Wvbpg
         mwKA==
X-Gm-Message-State: APuU4Z+DDYOvIFH8BlUDjbkl24OFaZgIUl2RZUF51VyRy8MT8PahB3Jo
	8KofxFumtps15DUhFBrEvnXjJnTiK0G99U+q730MddGxlm8yw5Wz8mSVGGDW92JP42ZHHdlkoLj
	aPEJazi+FbmyVlFy5L7iWRXUHEmR0qIA=
X-Gm-Gg: AYBFou3ApbSd0m3z0MbuaRvYu1ol3KxdekLIeGZgyDd8h7y4U6emc1DKR3LGNRMjP24
	jnF0mXUpQnXuqUNFzmFCJsh2aL8nq3xIYrneEFwbFSc+NloIwFRlD/qEttjteJgJq9ZHYy8epf5
	jADeYEmTWEYXm1rqneJKD7XiGkQKW0RTpU4xDIp1W2IuEevseaSE7/awU93WsT3Yrx8zjcR5nwZ
	aVBVrm5iIBcg9g8vJ8qdXTSQ93UmEBm+5D8Dhzxk/dMiCsNGuCmDGtYTPw6fAYgvG8frN+mpAOB
	81m89kCazIxLoqdTmuCId9Xwx5CI7VnO0LAFCSuQ9NxwQa3QMbj3xKcs+w3NqR1b23VwQbnY1RA
	g3kKN/sS4P7E74Bp2f95EKIyuX5bIRYq3sic2vvs6Y9f3Z4cZl5KF5X0a1JMoRLBdd5mNCBQ=
X-Received: by 2002:a53:cb0c:0:b0:67b:fe08:465d with SMTP id
 956f58d0204a3-67c568f35f8mr960610d50.106.1794317661671; Tue, 10 Nov 2026
 05:34:21 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031165117.2868671-1-hjf3108@gmail.com> <20261031165117.2868671-6-hjf3108@gmail.com>
 <20261105075519.GE64923@wp.pl>
In-Reply-To: <20261105075519.GE64923@wp.pl>
From: Jie Feng <hjf3108@gmail.com>
Date: Tue, 10 Nov 2026 21:33:44 +0800
X-Gm-Features: AclHuK_PDgR8aHaKuz5bam4i9_mP189IBu04FXCQRVhtddaHtb9nXmMWd2libHM
Message-ID: <CABOQOSUn_Gm8LJ528m-dsnyrvWQzmq_-1+YfTTUK3=Jf+K6XVQ@mail.gmail.com>
Subject: Re: [PATCH wireless-next v2 5/7] wifi: rt2800: support A-MSDU in A-MPDU
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 15:55, Stanislaw Gruszka <stf_xl@wp.pl> wrote:
>
> On Sun, Nov 01, 2026 at 12:51:12AM +0800, Ho Jie Feng wrote:
> > Set SUPPORTS_AMSDU_IN_AMPDU, which can increase throughput.
>
> Did you verify this works ?
Yes this works, packet captures show it working. However, the throughput
stays the same, but I think it will be good to put it in.
