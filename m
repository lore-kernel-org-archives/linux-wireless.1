Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371210;
	b=x4KlO3TGvNEUFx4Cww0eGESBQnaMJJV7v0Q/f/PLg7m51IumCoA52oZbtftj36CH7ipq
	 NQXspL3nRlW7qZvRV9MJcIcXI77Gl6Vvd9XB6e9OwfLA2tsblFRadlEkyEf+tteyY0PgC
	 g9J39pkPd1wOq8Z7qU1z+z9K7BeDquUdy5Mhh6bV0joz0Elq4SHeKu+GTHcpIMW0Qq4SE
	 wfAvAlcpsHildm1pieHgiztDxj6ZMMT8JTk19wgkmm7A+VxaZraTfzfJtYgZ0i7jD/uBl
	 X//fEKB5GB/HAvtmHjKw/SnlzFq+g+Mbu1yDwOaKa+mSEMQG2r3Q+Oqp2PvZ2zWJIcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PN4uLEIB+MU5TyNO9Hg+Xb+yNHfZcbzMhV7hOvpO8+U=;
	b=kSpFkbXECZnTGA6o4ITNlsvVjgrM4Q00i9sZpCqB+aaSkDnoqC2YVfAu0ar9e8yeX2pB
	 QN+H1m/SWWmpxWEHWPsQ4P643zq/uYr91HP9q0H7ozG0wIS3cT98UpPl9KtS7OtiIfIKZ
	 x1DcBXzXsm1dYL+GoeN5PHiEvPE3kHCvpCKhIQhPBk1reiMnsTffLheL9kG9H01UdeVvJ
	 27tXE9zs0svTnuN4wOlUOAy3aZrnTmME4Em4PZ0EpjCDC+EzwsT1saF9tF7Be/y7iCKXb
	 bjQWcnbwF1JSiMW1sneg67+vWMRQaYPNzt5C1QFVHxH8V7t76qRd32vdkbp369v65sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=cKf3+vPe;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AB5606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77AB5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=cKf3+vPe
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c516a160f91so92112366b.2
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371209; x=1795976009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PN4uLEIB+MU5TyNO9Hg+Xb+yNHfZcbzMhV7hOvpO8+U=;
        b=cKf3+vPetnEsyxuBHeEixlZ3PaXsU1/WVNIGeOBOEF3MU5iKZjdHTIyv/NkdQmFcbP
         ufjj+Zo5OZ1Yzd03DitazyuslIT5YtDRxuVBb5w0p+GD2iHR5UV9DMpdNCKn56DxmKq1
         KgyYl7NhjRoE8r1sfgIYg1pkzbTjW4JvgPek2JmIWbRB/pbJQ8QctNe3QTqOejNWnspu
         Eo9XGDCsUkutG0wku6Gn1aPBpKjxx3CxvZSn2UwAXRj1g0Ke1U419s+GvrrJ9Jmu5Ayu
         7Z83gY4mGInsjb8eWqv/iAzHoYJJ6NPrdceuiUQQzsJVxGQ5ZHqCg75mx2IiHTnGT8z6
         n2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371209; x=1795976009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PN4uLEIB+MU5TyNO9Hg+Xb+yNHfZcbzMhV7hOvpO8+U=;
        b=nAIGsrC27G1LrTRptCY18dEJuKmPqBW/jiJKE5QOCuanejVHG9yLjl7zdcKmbHIMi6
         1S6KiaihpvcF+OO0OUVj2aUFO3JemQUFK1qM1I3Jg08j6IYUv8e0ygxaIXPCw8TRfcSz
         /oFCUJu/F6ix4gtJ1gq5QcD351bl420YHxCijp0GkxCbwp1xR2+gHVAyKKAhVeqV+2Wr
         ZenzRcojPfus3NnPssAX6r+I62tn+9nqoBiwEALar+ixZzAmgWFQfGZsYUltVdBEgjS9
         X9s69mV3f1N6XJ8fY6vHlZsPE29TuA0D72hiiY49u3b9VZ7tqlWhc0wJ6LIuApIk/Oyj
         yj2A==
X-Forwarded-Encrypted: i=1; AL+hErG9TWbpUkSEf/fapub9ItZD26VAFA+qZzbC36tGF2SXhgGVdq0WAYiqcmKRIOEXhgZZAn1CsDQvhjGmOV7FTg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9h7LNbZrwSQ1CNRuSZA/civPH1ZvcBXfrdQofkxhIBMUC3Cewo
	Gz20G6+okEbN6PcUdpHYW0yhsJ/1YF97Hpgnn7dLgD1Ufkqxu3B4yVR/LUVozhZvkEDw4+liutb
	py1cJ4Ruu
X-Gm-Gg: AZFdTZclf+WOeqTYk/hbeCeoJbPGRP2gVwfVPPDJjE3LkUEyoEDIuAWj/6DooVfJHoQ
	DzHdqCpgmQwKeRt11yIk7WNFqcgWzgc0DHoxs4raDus9346wqztkRG5JD6p5PArcfJGbk/ZahrE
	yjVGoUk+XQWew73/YJNIY9A0mNB86uU/qkUHj99I45cuG+ihUSHFT+dz1N7tZnUJ6bfhexFDu9k
	qlVhJwov3N1TXJ4V1qEDD+P63TwzyX1lEw7B7hGFCCe1qBu12nwmMfKrs6vM6w32iQxBYGhMF5r
	NHH2oJBhaS3RyQyJLW06ZxFc9MqgXWWeis30cf6BVdydeo4b2A76thiQMoLonpsQ+RtoGP/sA2J
	55CUwqFDukqmsWhqj7GGbDhshCtChTihDkCDlZf1CrygDBzCHjyOMBuCiA8mng72ZGTsYrRMMpu
	s4XES5lExeTA2rgpZZjG+5yqVpRHdY5AM0aE101YpbI5GXpwds+lRaqM0oMzo0oDHySyyG1P3Fj
	qpXcuYjcGqjipTHIN62NMXpqeQLeD3InV/VYMZx9ex0NfN4xN/8eBXpmoi7m4XjI+3u3JDPVzZM
	g0AIpIaRGCNjZcN8lV/XuZMJA8UrzcemfOSp+HCA8pjZLnlb9TAqw9CTRw4ZVlJOdmCIx38VD6K
	B3Kaqi+64kT7dw9Qx9HeitFkSMWkq8VQDaVkOiiUMgrgvvFn8NxPSRPZOPH7xNv8652Sve1yQeB
	ai/c0j/7Kr1rfvbkTExrPRFCAUuH+/fVdw7mYoaAEuUC2MdbodxX3Vg8gyo3hWWv6JVj1u2RDYn
	bPXeew71mdtaFkEuiyfkuGkJCeFuAGHT3zdKHCzXxaDbx9qaTF1D34Y7ujb0L66+U6mx0GOG291
	6RPjdqgKWMtu0pQiC6v0pJMhAHfDOPy75ovEXlU9VwoD3ACYOOuLnBfF6F7iSJnn+vFWwA6W
X-Received: by 2002:a17:907:ea3:b0:c3f:e414:d35a with SMTP id a640c23a62f3a-c513ab013b6mr698428166b.26.1795371208914;
        Sun, 22 Nov 2026 10:13:28 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm328879666b.85.2026.11.22.10.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:13:28 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: christophergriffin05@gmail.com
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: Re: [PATCH ath-next v5 0/9] wifi: ath11k: airtime queue limits, airtime fairness and a driver TXQ scheduler
Date: Sun, 22 Nov 2026 19:13:30 +0100
Message-ID: <20261122181330.1018334-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAKobHXAfLKmJWSP_xNKwmNVkd4M92XhVXkVMcG5nxCBnbphH5w@mail.gmail.com>
References: <20261018174904.1757161-1-julius@bairaktaris.de> <CAKobHXAfLKmJWSP_xNKwmNVkd4M92XhVXkVMcG5nxCBnbphH5w@mail.gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 11/10/2026, Christopher Griffin wrote:
> ath11k_mac_tx_push_txq() checks the TCL ring for room but not the IDR, so
> without the airtime limit nothing bounds the frames in flight. It may be
> worth ending the round on a full IDR too.

Thank you for testing v5 and for the two code points. Both are in v6:
https://lore.kernel.org/all/20261122181145.1015729-1-julius@bairaktaris.de/

8/9 now also ends a scheduling round when the ring's MSDU idr is full,
so with AQL off no frame is dequeued only to be refused with -ENOSPC.

> For a DL OFDMA or MU-MIMO PPDU, that charges every station the whole
> exchange. My duplicate of this patch divided it by num_users.

4/9 now charges each user of a DL OFDMA or MU-MIMO PPDU the PPDU
duration divided by num_users.

> Tested-by: Christopher Griffin <christophergriffin05@gmail.com>

Since 1, 2, 4, 7 and 8 changed, I did not carry your Tested-by over to
v6. Could you run your setup on v6?

> The 4 MB cap looks worth fixing in mac80211 on its own, for any HE radio
> without VHT.

The 4 MB TXQ memory limit on your 6 GHz radio is a mac80211 limit
independent of this series; I sent a fix that counts HE like VHT there:
https://lore.kernel.org/all/20261122150459.3108416-1-julius@bairaktaris.de/

Julius
