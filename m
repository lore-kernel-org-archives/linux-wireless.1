Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595869;
	b=3z1DS8xnpBvURovx+4ge63RvEGivA9Zbf/o71dvfaAHKob0fty5TVghGERXfRLJT+b/1
	 zHnMZjE0hp8vDO+avmq4SDhF5lWn6U10DFouzjSx2SBWaO51LyrxwVkgQp+rmPFrAwiHh
	 6ty44Rlhuf9nFf8DDEpE0IDMULCnaVJgXs3p1zRiLzcZCc7c2+aaRLewqWzX2ynETdPeJ
	 RRSGzLtkAv0JAa5pqQLJGZoA+VFZQzLE296lazuW1zHIjMh1fvZ7n2Ux+rrYi1OFqsbph
	 fNhiQVYI3wStvAFaLphdGb9teNh/+rxSOlNYCSRjSFDDpPFWtouIGVpsR+59L+v9Cbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mKicS48dhuS+kup1GJfFYDCP95jIxBfuRfIt0EplH08=;
	b=ZImBRZZzIWebT6cDpTsR3MZLkiHa0tjJYh05EaIzys8PHcbypz5RTGM2aG1RqdOsviyQ
	 Wre6CbokGSsJb9FJKrmJ6BOknfIA93CQSP7RlJzQjmSNuXbJVcACeLABxVFkE4+Nhcooq
	 CCXy+wdooDuggGxfyjpYhct2hL/htAFzrNfM0bPNVyQDkDL+4Dm1RKpi/2Lmkgtda9JHn
	 XtSRadrrgniZVQxj9idbf7GsP5KDHNXUKrguFlQTRTA5i+oLQbs+CYtwnK0CFysHIUuI+
	 WHQI1FEw/yUPp+O2AXfTYF2TZYy8MIJGcosHkyCxs8iicNutqahn5vpLpg1vYWydlVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFWZaOFu;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4CB606A332
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 08:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4CB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFWZaOFu
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a3c08d6928so8041261c88.0
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 00:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595868; x=1796200668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mKicS48dhuS+kup1GJfFYDCP95jIxBfuRfIt0EplH08=;
        b=SFWZaOFu9qpubTwvgwBz5nB64wkLvIWj8UKXs6S6mXb5+mEQHD2LWmMAx/Swpa4fPo
         SP60mO5V1VxfAJRVMPudYgO+bIB3n0LLmSemU7EjCb7iQ6fzMb29biQ3H/MQuLvBHr6p
         MSTqaarqp835AVfvfuyG9auFwXNVLUQiNvLDZBJbtsrEOa1NYVoN5aMcRn7BBHVciPRC
         dp9zvVo4gNYE9lbVISyrN9w5EoW9RqZoejcO1sxEBpHKf+D+cfdhSJ2/7UnwCISE4Izo
         i/NiovJ2862honlrNXUujEfA1Jg/0Yqo255bDYgb5qUft2EjaOYcMfXIMsxjvCUvdQhN
         TQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595868; x=1796200668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mKicS48dhuS+kup1GJfFYDCP95jIxBfuRfIt0EplH08=;
        b=uH0vhCTDAIPCKqZ3Dt1vTqwAvbW1fneqGbWMLDllyTbBvykFBIGrYtzeGDJU0AlKkE
         7PsnEKmk0OEUyIIWXAfJwOZfVtwA6dtTz4X5u5OYqGVd21k9xckc217LoWOjzXtJg0Gd
         kC3H7OXF0GpVjEDCdUM2dg1dxuEiKfIoqbOqc7nnI3uuhiae8v7pIxDepv/aqGlLDubl
         Owi4C2zyaO+BqIoQXT5vAltdxiclI6tq9GunsK0nBX/wDNVeB9M2sGpz0AQ8BXwksu0b
         rfmlLz+/+T/XVa+979HJTV7myc1IRHC8aKKEfgATxVmQFYO8ScraaKy7rrJB/6xZR0VL
         y5Iw==
X-Gm-Message-State: APuU4Z9uZZ3IjuqG93wsY9cMb0dcJJxofq0Ap0bsuxD6QEYC9ls4LmKa
	l0qS6AFTywska8pqTCqrFEK8z8kEQ4nClRAoVYMCUDh+Fw45uf7YqWcibXaVgg==
X-Gm-Gg: AZFdTZeHnjrk3MKk48cOrihYMUiwJPAQuE3Feu8O6+jTs2JwEGYLdBNP6lFy0zeH9tV
	XIFz2kE9ZY95qq3t+gfxH2VgE8AR3wtrCEtc3NcQLBR2Rgtk5OfUNkuRSIaRnkZGYWOWL9VLAyt
	0qio1jblp3NqlZDi6Gak1etbeCmrDqbpkKui6HgtudLNGH1N0HsqevuqOSVA1fnDJvPL213thMh
	i41Tu3MVL0Q2LmUflTtUh6xSOqckuugewVV24v3kYwEjmRu+kLEXA8wlByL1WVuRYtDR8dOIm+y
	J5iTF749c2GqGnQAgyPdgFSrp1F0FsWtJZNfoRFzUBJxSvuFhuzyHWLDKbXOREWqhluO/Sm25/r
	YszcWbESrzIF18459MSvbQKKHy3nd4X/M4+4xmXrN+9Rm0/VPm4nBDig9iVh1XO4ZEzllaT8Ml7
	RYTxVfOuTI/qMJH9CIisF9J5cICo0FpyY8GhwCeDUAaqRcMBVnP4MeIjpRc2HEWeKKxPBum1qxx
	0NlLtBf3rV1xUwgYC4r9ZUATu9g5oMCy0SiFUVoB9qY+ZFuNLHd4H8HIg2Mme+AcN8PqKZFWlMv
	QS7zyLDAEiVGynT3UsTer1TU9Lljzd57CKqs1uuj2VeOsf/KjzRz1Q==
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr19724901eec.22.1795595867818;
        Wed, 25 Nov 2026 00:37:47 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm43927422eec.19.2026.11.25.00.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:37:47 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH iwlwifi-next 1/4] wifi: iwlwifi: mvm: validate TID in TX response handlers
Date: Wed, 25 Nov 2026 16:37:39 +0800
Message-Id: <20261125083742.1355074-2-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125083742.1355074-1-maoyixie.tju@gmail.com>
References: <20261125083742.1355074-1-maoyixie.tju@gmail.com>
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

iwl_mvm_rx_tx_cmd_single() and iwl_mvm_rx_tx_cmd_agg() index
mvmsta->tid_data[] with the 4-bit TID from ra_tid. Only the first
function skips IWL_MGMT_TID. A TID above 8 writes to the members that
follow the array.

Add the check that iwl_mvm_rx_ba_notif() has.

Found with a CodeQL-based static analysis tool.
Reproduced in a userspace harness under UBSan. Not tested on hardware.

Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 drivers/net/wireless/intel/iwlwifi/mvm/tx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/tx.c b/drivers/net/wireless/intel/iwlwifi/mvm/tx.c
index d3c2fe830477..d06ce3d1eb68 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/tx.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/tx.c
@@ -1731,7 +1731,9 @@ static void iwl_mvm_rx_tx_cmd_single(struct iwl_mvm *mvm,
 		    mvmsta->sta_state < IEEE80211_STA_AUTHORIZED)
 			iwl_mvm_toggle_tx_ant(mvm, &mvmsta->tx_ant);
 
-		if (sta->wme && tid != IWL_MGMT_TID) {
+		if (sta->wme && tid != IWL_MGMT_TID &&
+		    !IWL_FW_CHECK(mvm, tid >= ARRAY_SIZE(mvmsta->tid_data),
+				  "invalid TID %d in TX response\n", tid)) {
 			struct iwl_mvm_tid_data *tid_data =
 				&mvmsta->tid_data[tid];
 			bool send_eosp_ndp = false;
@@ -1865,6 +1867,10 @@ static void iwl_mvm_rx_tx_cmd_agg(struct iwl_mvm *mvm,
 			 (queue != IWL_MVM_DQA_BSS_CLIENT_QUEUE)))
 		return;
 
+	if (IWL_FW_CHECK(mvm, tid >= ARRAY_SIZE(mvmsta->tid_data),
+			 "invalid TID %d in agg TX response\n", tid))
+		return;
+
 	iwl_mvm_rx_tx_cmd_agg_dbg(mvm, pkt);
 
 	rcu_read_lock();
-- 
2.34.1

