Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098689;
	b=RNEep1UoKahFsUnufxbvBhZTzFr87vrf4oyzDPSZVEfbkB7ZKYczN5Suwkm2B1Fxa9JO
	 +TfqeFkKtIAMdtOtpWMrnjmz5ZYHOnd1IdpvIxTA69XblIBJWA4V0tlaML1/uCp9Rplef
	 L5udfQNh7iVwAHdvQ0geBjJntvlz2DwpqrMDB/r+pDMulFCoEWF3Ago9Qn6rClrFyy9DB
	 /HbzIr6HodNc88vZdx83KShPOd5/tVRyvSWizafEpCHnDxTtE2TN2Va1W49wVnluqy72P
	 4nxwYfOZB8nkzoX6yeTpLFJc3oa2+gtDm2nUKQJakoWBJeo2kuAZYpNFv2S5SN78lqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098689;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UGyDRQhGJp0sdAUdRryPrOXSnYzvv6R75u6YYlxIRuk=;
	b=1rDwjfg43qXOh6nZGMY+JJTNGqxOQmUPfQx+QdJFNcE6BkTprx9rGwHWBmYQSM6ei9sJ
	 EJY2kt5HeknLxikyULQ0hfP7mMgk2D/309mv6CY0bsv0Uy8D4w0qPHUbMWdLRwPZdvAkW
	 33u2xuulFxnMy0Zycqfz5bzs5/Pkw/+6ve3SRm8sxZumcCqKVPeR2rlWMOIvS7ciaiJ36
	 YxFcLCejg4JEDBbPJ4apleJbC2KyvMzBSaPRKYvnRzSNzCEj73LOM4Xa90dafsGNj++pr
	 F+kSqF2aXfC/JPxxOEASnN9C/QX9KGzE/UfG2ZDJEoa0D8Asadqug+w1YQKLyJBM8Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PmUFqYHA;
	arc=none smtp.remote-ip=91.218.175.220
Received: from mta0.migadu.com (out-220.mta0.migadu.com [91.218.175.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D68606A324
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 14:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43D68606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PmUFqYHA
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UGyDRQhGJp0sdAUdRryPrOXSnYzvv6R75u6YYlxIRuk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795098687; v=1; x=1795703487;
 b=PmUFqYHAo3CCYv9WDhueuP7q/ydKzjD9jRwuw+yYf/TnrEZUuxSDx1v0LTnPl2Ph27pGEIpD
 /to+QCRDHBPry+xD/6RqTGjS08h2vL2gRdMJyuGfOe2xEMvYTFxaDyzSbGvbblhTf+z06lW3oq0
 a+OcTgknkVX2Fw6oUD3VtQwY=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 29c5f9e493d311f3;
	Thu, 19 Nov 2026 14:31:27 +0000
X-Mizu-Trace-ID: 29c5f9e493d311f3
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 15:31:21 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Sascha Hauer <s.hauer@pengutronix.de>, Zong-Zhe Yang <kevin_yang@realtek.com>,
 Tzu-En Huang <tehuang@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_0/5=5D_wifi=3A_rtw?=
 =?US-ASCII?Q?88=3A_fixes_around_the_firmware_recovery?=
In-Reply-To: <20261117171003.1840491-1-mehmet.fide@gmail.com>
References: <20261117171003.1840491-1-mehmet.fide@gmail.com>
Message-ID: <CF888347-648D-44CD-B7DF-243213F96737@linux.dev>
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

On November 17, 2026 6:09:58 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:
>From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
>Fixes for what a firmware crash test showed on an RTL8822CE, and for
>what Luka found in v2. Patches 3 and 5 are new.
>

Hi Mehmet,

I won't be available today as I am going outside my country's borders for
some trip. I will take a look at both of your patch series and that RFC you
have sent in the meantime and sent my comments when I am back(I won't have
internet there).

Best regards,
Luka Gejak
