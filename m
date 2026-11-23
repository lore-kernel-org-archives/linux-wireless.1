Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430310;
	b=xxHEeYxwr9u/G1mmH5onhtGPcDrkR1oIhPFLjYOFgIjhXAeEFT97lisKdBup0W6Jhry/
	 kgmqqzXDZNv9KsEPw+7ElYvxmiRnxxJ6cPJpU1HCyK4CiBemPmvzohtd6Qz5uL9CqWmmC
	 UOa7ueqbuSmMnzmTIcyU90EPbSGcUS+rGQbHhKTIIO4KHKwUIplRMwp66D2Zo2GJ4kM3L
	 5HrwO2wz98kUuMJLh8qlZVI2lilqJp0RhovRyz+ukOoCQ7/wRsfryEZ+tV33x04PmycvS
	 3QaMFKQhNe6KL4lNldwYsKfpAg50ouqOeiDitlS+RzouV5DqMYZm0KPtPg4bCU8y0lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430310;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=RAnEO8/Qdhkb1cmdMFzU3CHoAJo95PrugKm4CPHlkHY=;
	b=AlHkBODlxP1y9Xh/YvYLZXfU6OpzljT6nNjLUnxPpPqMxjlkFDuEnCZh7911kGpwiYP3
	 OYByhz4AH1TCIS0kZ0Eu7uG+EgjBXBSHCjUZdcdnUob0AGwV9CIQsGz+BMGbncQLT0qjH
	 V9NJnGf52jYLmJq+bA8NEtTQAQALme1+KCVb1XGN8HkbKKsZ2BQNNSIkzdHB6+kiQmtCi
	 8rsXoiQZX/8gLTxzkMU9GLOYxuxa0wb7udS0wVk8nK/pv70pCLp62sE5eBf1ZFUHmZPV8
	 xjdHgyi6rFXJ8M/eqdp7bThG9k1QPeRur//tetlUM4AGPrqHH/EHKaCxsGSQLrFCbZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flakoFA+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711A5606A32C
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flakoFA+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D48F1F000D1;
	Mon, 23 Nov 2026 10:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430309;
	bh=RAnEO8/Qdhkb1cmdMFzU3CHoAJo95PrugKm4CPHlkHY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=flakoFA+bU7yWX/F/IOCGMS7LruQd4puGwMDHj2KejOyhltzXHW3lMKavGxA++zL6
	 dW3q315fSC/3Lqf8Wo8GbnrevIokLM8HxftgddfhEG6Vz58nK3rKHluM2q71ZSWLGo
	 R/IvJ2ocITqUf+YtuNEjuOmxiqCIk23AQdDRMPHJxv2vNqunjIf1U7zdQ1eQhSZC53
	 2ulsRZXczB57XFtfcCjfH1jUwuXLFZfrBuoRvi+Rn+Lgu55nub1OdqwFXV6asm1y4H
	 Uix3L4ooyw/Dj9W1Y+w1AV80eSIvN+/ZdlBDx0cKrBjwmAwy8dxVpXCJcJ8ZznDs7H
	 dudEtyTY8WSWA==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 88B965FED9;
	Mon, 23 Nov 2026 18:38:27 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-wireless@vger.kernel.org, RFAREAS Support <support@rfareas.com>
Cc: wireless-regdb@lists.infradead.org
In-Reply-To: <78DCED16-8799-423B-BC5D-91690821B766@rfareas.com>
References: <78DCED16-8799-423B-BC5D-91690821B766@rfareas.com>
Subject: Re: [PATCH v2] wireless-regdb: Update regulatory info for Belarus
 (BY)
Message-Id: <179543030755.976281.3457870716585281409.b4-ty@b4>
Date: Mon, 23 Nov 2026 18:38:27 +0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 23 Nov 2026 13:24:12 +0300, RFAREAS Support wrote:
> The BY entry has no source and allows 5490-5710 MHz at 27 dBm, which
> is not permitted for licence-exempt use in Belarus.
> 
> Licence-exempt Wi-Fi is set out in Resolution No. 9 of the Ministry
> of Communications and Informatization of 1 July 2013, the list of radio
> equipment operated without a frequency assignment permit. Items 7 and 8
> were replaced by Resolution No. 13 of 29 August 2016; Resolution No. 1
> of 10 January 2018 changed "output power" in item 7 to "e.i.r.p.".
> All three acts are published on the National Legal Internet Portal
> pravo.by.
> 
> [...]

Applied to master in wens/wireless-regdb.git, thanks!

[1/1] wireless-regdb: Update regulatory info for Belarus (BY)
      https://git.kernel.org/wens/wireless-regdb/c/5ead4f45c79a

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

